Return-Path: <linux-arm-msm+bounces-79659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E45BCC1FB1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7A813B64CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B06F238175;
	Thu, 30 Oct 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hckJrWJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsZqO4UA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94DB3595B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822196; cv=none; b=gyorWyWB3tyUSMp8KJXAl1vBG1VMSONfaCCPCkom6ykYTQyLHeWkeoGtooZTx9jXlu4nrPDh0Wdc5Bea8sJNZrBjlu7y+4BIE9AXRLk9bdnXGDggYp3KctREPGH77MsfmNopQE7C/EbsLfHfDSAuhHPsq6i2p/QW1Yva5Pga7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822196; c=relaxed/simple;
	bh=K3tS3ToI3HJBfPETrHR5PnpCoFB1dZJ4Sgka7xCNViU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cr88Dse0T1C2GhwDIHmst7X5zdc+CYYy+eZ6x7zCTTV9afPgf2jntaqUa3per9Zi1TDLm0Sz3RxdPKP13RGz12FdJnV1PVbCdLljn+EPs3pg6cQdFkvYnEQ6H/9cTGjPsfQzHxop9JcvHldhCAVaXXf7LvTMmF8bkxxCEINfXgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hckJrWJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsZqO4UA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9Q6hE1994438
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	28+IQvDYGWe7uO9MMcaeS+ckpIgwiovtSbo5x8ovGBU=; b=hckJrWJC6+evXCtI
	wIwAcFdYDliS058A5GQllOxEZ+M2Q1eqHE3gkrU+JrfvXVyVOqmENzX2LQBfn5SL
	WlJ6usgpLceU4ET7ouww3+tmyczAaVg+uszu8T+hVqR1Z1afxbgjJDSHOuT9maWG
	23IZRbN0IqcdyqGMBnabVn4n8j7FPMZKwylUtfHWAtOelW5UGsRcsNYDjok/7PEJ
	NshZ02vS+Rz5Ei7o5h+Jvbc87QaKQv2muZnkgcEy/zP1NiqD2ZRpZcj4tku59mko
	B05fwWzPigwj5pOopg6GQjWREJLMb7hEsOw5ip8MYs1rouORS1BLHz8OZr35mYiH
	t8ryIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr71kb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:03:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88e965f2bbfso30523185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822193; x=1762426993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=28+IQvDYGWe7uO9MMcaeS+ckpIgwiovtSbo5x8ovGBU=;
        b=JsZqO4UA6Iyef64GfgqRzXkT9IJTJLqXq9wzjzigrsuS4C3TplNpsuR9fnsUcyuk0t
         AvLPhjEsVW/3glT7Mho9KzD3lj4JDX82m/fOsbUoyBSqTfKLmEwkVb+jyK/wKupYBSk8
         bUWR3ipXI6QzycjqWTh/K+mWKDgCx1iTBaLit5o5jnOTqVnNH0LEaLNmtOZyh7F7b16/
         VHJ7h0/Pk/7YIlbi1gT14qVT1DRivtiTaO3VyKCMeZYO4RNmWnLJX3Zqnw8v7HyS+pJZ
         W3Bx/lf71f15mphO8keSjV54heeAmEdseXP2t/GiYgDl0dETQ4dEnWnE+8uPxzOyYxgH
         j1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822193; x=1762426993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28+IQvDYGWe7uO9MMcaeS+ckpIgwiovtSbo5x8ovGBU=;
        b=WvdV8NnYmaPrF4RWnAi+6vB5TRId61pB7bws3BTwUlTIwr5tLeVfMh7gKu1b3SKgz5
         ukHf1SS2f2tgl20x7iqBrRQ3ky9Fqh1Fi9VUCKtt+ZITWfHm/Qd5N38+r3ZmX93jNqf5
         fbjMTfsifLMZ1uxhhrSAjxmz0FITWteczixKDpNT2WcaF87a3lQ6Jtw/SYIyX8RlS1Pr
         7TjlJVdFXrnDA60Ci0NyveHbsL3v+KKQyqko613DIX26PJ6CunVi2GzbWBIU45ZRQVk8
         J58GLnLV+OQDtKcpmRsoeA+MOV6Fvm99nFvNz92ZSqGFWttT6XShAx+whai4TRxt5lmy
         BwIw==
X-Gm-Message-State: AOJu0YxI1MH7KKHcioBHzKeaZCPLhxOx/ZmKKOtEZEqTvSHyVo2Q/L/n
	AErZWspsCRFZs3i8UT8pGgkYWlncAOwQOZKNU2TN1GNtWj6fG2Nln2Qa2rUaKU2JG7AukWxUa2b
	8xzfj2M6zq1xqHh8RQ79WfOYOcTbRK1B6BFWvCH6IG8tNbkSALTZZudpxgWQVm1fCv6md
X-Gm-Gg: ASbGncskQLO5hTX03wTD2x/v4FTbkfAsYDD/7pSIIbjwOoxCYiqzqWj9zSWRUdYrTA5
	FDPuUHmf0v/a5nYi3r6iHX877i9p4zLVIb6n4fZc+c2bT9WP6FA1IVlQluQDNqreAZvKGymchbi
	8qry4bKLJOBwD36YbtpKtGHtw/XFQ9GE9+aj8N2dGEJvAJkWKcTwkt3g496qUTFusVyE16iwxcO
	KgPkQ8J8qA1on1rindl4Zp3ZKUCbf1J0DQkbxGawoGoE0FfUabJ6mTaibeWmv8UdxUzzPWeyBRj
	JBiDuPdzWZkN1ucQkgtyKoRNSAC8FlNy97VDaoK3cSzDdFi5woHFnv8jskkKmMF/6llyPEmW3Ju
	wQAOtAk9uBwO50Kuoynqk1Ic3+riTVrZYgEqsQ71CvFed7rpDtwozwSvm
X-Received: by 2002:a05:622a:19a3:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed15b933ecmr53084641cf.4.1761822192906;
        Thu, 30 Oct 2025 04:03:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNX3boM5mT3X7eOEVt8aKTIGuYo3kAnc3hoxOLBCXwFtnDsZZ7KW5N5jYdMviOa/O52vGgTg==
X-Received: by 2002:a05:622a:19a3:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed15b933ecmr53083931cf.4.1761822192071;
        Thu, 30 Oct 2025 04:03:12 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85413b88sm1693589866b.55.2025.10.30.04.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:03:11 -0700 (PDT)
Message-ID: <9706f744-1cce-4a17-8e99-c29182f3bcb9@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 12:03:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sc7180: add gpu_zap_shader label
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-dt-zap-shader-v1-0-7eccb823b986@oss.qualcomm.com>
 <20251028-dt-zap-shader-v1-6-7eccb823b986@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028-dt-zap-shader-v1-6-7eccb823b986@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfXxGdNKwYJunkh
 vlKG5tCtOvdsGWTv9kDUZw1FqYzcSMvgYWHXT4eK+cxkmGJo60oVR/Cnv1beUZ0LISAyHbP47fP
 ErwHqRn5V0xF1xmVfe06/9PmsxqYt7LohHj0/AoWP1p9pMa3PkKC5hbYsayVOHcgMMMNXWwpKfr
 YES6CVtFRsXYD07Jfkat64lrr8Co3hveZ+b9uZV/lmvpHLQ15GhrLI2akQwInkQPnJ7MnwaIy8E
 NRYM9rRAbhwUKuenjUH4eFun0NrLKpwMmE1nQYeWnEQ0xnxoCcce4uE5XvojE6cEnh1Dizo35xX
 pbfmEWe7ASYmZH2jgFfeVMEC0XbITETR/gRe/Gq3UUj0Z8mieMPlNYKfKujJpT69t5fJc2k0BZD
 U1GUgKR2rpU+/IPJLObv6wkKujza7g==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=690345f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=S6OGlrJxYZSBbBCeTXAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1-AV-b573MvgXMc1ea3ZxMPVt38yIl9Z
X-Proofpoint-GUID: 1-AV-b573MvgXMc1ea3ZxMPVt38yIl9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300090

On 10/28/25 10:00 PM, Dmitry Baryshkov wrote:
> Patching existing DT nodes based on full path is error prone and

this is not a full path reference, although DT unfortunately supports it:

&{/soc@0/foo@cafe/bar@dead/path@1234/pleasedontusethis@321} {}

> generally not recommended. Add a generic zap-shader subnode to the GPU
> node on SC7180, delete it on trogdor and IDP, two platforms which don't
> use ZAP and patch it with the firmware-name on all other platforms by
> using the label.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

