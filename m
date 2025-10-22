Return-Path: <linux-arm-msm+bounces-78379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A487BFD54E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 18:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A77601882727
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A3F27CB04;
	Wed, 22 Oct 2025 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOnaTDWD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A752C11C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151112; cv=none; b=JVEcF5QXwlOsJ7fx/yJpObseQpDmy3ISA30Ky1aXPvy0vkYOd5yvq7UljQW7pDplDoZGUvtSwUC9RlnDwQu9GeRfsWjSOXGE9ksJUO8SozC3aaNtMONrAqizWEDpZSA1KV7Q6GN3AvlSJziPu7sJ/f3ysju4fpBPpc3q7C21n5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151112; c=relaxed/simple;
	bh=ptTXlSwGKwMBwM41aPaSp9jgtyBevA5FsiIBwd9TsaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxjaByV0ZCOEhd8r0/cdRQX4BI3Z4aVoFNo2+gFjtQG/FNZgoioOib/qjXi+DysyZ954Wh5aWIWTYVodT/nBD8gm1P/wpj0VAjgJ0tdLjQE9UPNC1nv8s4nh1ekgT4P5ZoGYiJOdHKsP9GRxlpSfqSc/4wEZ35MtnDusc8ELJ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOnaTDWD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M8rote024879
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07OU1z1hNxrGxA+md7kscEsHiEoFwg7IhtIMFNGGHkY=; b=NOnaTDWDqHKfBvMg
	gkcJw2k12CGgYvyybuCsPTbcYgdeP/z4OmxpqVKNhDaTS7PvB2Q6ceZH90bmYUKq
	T/GY8YsXKZ1KbLNgeTKwoS+DRqepBTwNNY4AV/9qNGJUWJNN3WcrMJaSF3uVHxxw
	1GwkGlGKlEMXYGrE3IsUk8mSgR5htAFyQq0vZT0dIvb+lsxB+P4gXhyKkh2c8nr+
	Y0K8pD7jTKFOnLF/aC270TyCXQ8gEu+VpxRsVQgcggc23zBSDFkujHZiUsrm4Dj3
	IEgmhAjSLnd43uw9oyloPNgZhac7FgFbzIcFc5Nh228enP8swqNnWq8JjoTCzBUW
	mFCRrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws7rep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:38:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8934ae68aso5675541cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761151109; x=1761755909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07OU1z1hNxrGxA+md7kscEsHiEoFwg7IhtIMFNGGHkY=;
        b=aSdlPYnG0DV1LkPH9mYfyEC/CywOU4mugIzO1WO9ajAVNjzZPYVxxPZOZ12UVNfwip
         wk0NTKKxic5mZM/5XhkkLcN5jlgr+Ho/fj5nSObma4tdLUC7KZUGc2YIiD3pcmTtHUWs
         B4ltjnf8OdptfrUk2E5kGcILeRxu9+7btU8Ufel3hFZgp6FkhsmbG81VK0WcZzTJ1Aos
         +o1gfFCy0flymz8EHhlUJUIWiyGX6jvJpsy2t4P73+fM7fJ3Gjs2lYcQ3pKv/nkzlNoD
         4MCeuA2665GibXb0UPpXi2ttSvtudRO/AFr/o3V2evkz4zVgw0kFD8fvGUdmyaPEReDQ
         6ycw==
X-Forwarded-Encrypted: i=1; AJvYcCWhFKBF/V0+t7M6waFUaHXyvowzyaQ5t79Ic/2xsWy7qBOmM67AKGgVBH2vgiydePDHMTBUYLpMtWfHGZg8@vger.kernel.org
X-Gm-Message-State: AOJu0YzVPXSdAM5pjC46Aj+OIXAMPFSqUJ2RCMxeDpP7mijWpNbHVZUa
	ktswTsG0dY4tNQMWGXj1lDfKAtXdFabWXalD7cE7QRWZ4515XFx21/1Z7f6JOhhKX9Igj3bdm3P
	Pp6hyR0FDHN4paJEMoZ6BoV8K5U4OjlE3VQ5fgxZ590+2vUOoklbRwr7CBJN9whAizD7k
X-Gm-Gg: ASbGncvMf4Jl9XNeDMHQ9Q03inGsoMgo0YPU0RnCw7b94m86mwQQpjMR20S+Mwg7b0E
	2xXRDUbvpxDPTyYYZipK8bP4gB4iKHcexxQV0NTMwmEH1h72ZYTyV38Hdunp4CfAqI7KgW1CQ0e
	Kr+5ovflEK2JRPsG2lcZlOBikg4yg+NvC6DmvgoVmiO+TiTN/BE8B87GCG5YOd+HZnAOVCggkmv
	+cIq3gsSzyoRkYuHnBYmSMjKIGNWDqdTYha5IiJz4KWWhNmxFW7sNtmkBQi4l+/1TY9/xVjBlOE
	14g54sJvjaiSJMZDgyxvhtWSJOKyQHlOvbmHr/6G+G4tek8vxu42d9kwe0DWzHC8s2u11S9obYF
	CkpX3zh5AnEughPRE/SzrarqoaWIMYgUWIZeZuQYrdyIKKEEWCz5CPo12
X-Received: by 2002:a05:622a:548:b0:4e8:b910:3a7f with SMTP id d75a77b69052e-4e8b9103edemr124725351cf.13.1761151108814;
        Wed, 22 Oct 2025 09:38:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRYPknr9Uj0amxUOYfxOvPxxQnoEoW4H0vD0Htc0V340Pcq+BvtCrnq9gFpLvh3TOojHocGg==
X-Received: by 2002:a05:622a:548:b0:4e8:b910:3a7f with SMTP id d75a77b69052e-4e8b9103edemr124724941cf.13.1761151108268;
        Wed, 22 Oct 2025 09:38:28 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb03649dsm1375160666b.50.2025.10.22.09.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:38:27 -0700 (PDT)
Message-ID: <06f74fee-9ab5-4b26-9497-9f617edd97f0@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:38:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251013-topic-x1e80100-hdmi-v6-0-3a9c8f7506d6@linaro.org>
 <20251013-topic-x1e80100-hdmi-v6-2-3a9c8f7506d6@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251013-topic-x1e80100-hdmi-v6-2-3a9c8f7506d6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX02t5gxG8qxl0
 gQ1xiCwzLuYNWOck2jC6kGdEaReu/fCc29Q5fIDmLPq84YPEU0ndwlGegN1i+HouMlL+7nnMtl3
 j856UsMMRadodBtUB8PNRhwJP2aJtRRY/XpAJvvBe2VdSKQMSiYfhcyIQKky8gTsFKucMRutWrG
 bG4gpKighoPHLmAu5v3HhCSfMmkl2h6HlkV6vcEnuuUCU8ObOPuIdqNbwnp4NWMF2kMVjwWJOOS
 0ZL1FIb3T0HO2socOcsmXa+nwlV+khVG5AAtS4vHDuAzOE6FUOKiYS2X+MCarn6LXdJkS1sRiuQ
 mROt5lEp8OUN+zz9Z7D4R5vkheS66ZLtxOg3x8R2ylKH63sg8+2rxsrgcYTlgZdN7pB0SHxY9T3
 RTdEzczKYo83qY3eGAe2t0M2A6T+7Q==
X-Proofpoint-GUID: 4f0xFiNH__6tvqGeHhHO4zEQYqiDNKAa
X-Proofpoint-ORIG-GUID: 4f0xFiNH__6tvqGeHhHO4zEQYqiDNKAa
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f90885 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=KKAkSRfTAAAA:8 a=HJemwo2QgkXW1dxJUx8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

On 10/13/25 10:55 AM, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> Get the lanes mapping from DT and stop registering the USB-C
> muxes in favor of a static mode and orientation detemined
> by the lanes mapping.
> 
> This allows supporting boards with direct connection of USB3 and
> DisplayPort lanes to the QMP Combo PHY lanes, not using the
> USB-C Altmode feature.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


