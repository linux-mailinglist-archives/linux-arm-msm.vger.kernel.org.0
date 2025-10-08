Return-Path: <linux-arm-msm+bounces-76398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F570BC4CBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF5263C7725
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B763B2459DD;
	Wed,  8 Oct 2025 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8wzapt9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368EC1E47A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759926684; cv=none; b=OnHf7MqiYOm7LEXtbVB0TtGRIt5Gkfamoq9dv46Ru2EjoE8dPVuRv1Wge82ngZ0r4e6gsaHoRwJIIzCMJUd2BR9cS7PX2VnQUIPCba6fFgYEJnOveDvoWYDp33yBQQWhryNFMvdt7uLXZbHolLmkBAblMkXXv9U7jrvN69yXv4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759926684; c=relaxed/simple;
	bh=NBUAGxB/tBXvLkcWyZOr1Q4qRMURG2fiZWYNgPUworQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nay6dBiGdGqT6az0/PF7rmy38+QfG1BYV+dUwiQev4gUot8GW0Ck5XBdTGmluzrrTEXl/jqti4wUe2NePX9JpIGb27SvRdpwzZXd+f7HN7zEEUTOejfo1992Fu8Fmcb99P255AXpcpi29Vqt+V015C1utPWHUXZkZockkqKNbRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8wzapt9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890aE1002321
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6QmyeNzk2DWtq/5un0rKTrn3/g/0gZ7LHuSs6FDi+Q=; b=l8wzapt9DQeNUk38
	umAl/VcnvDBK5n3FOf3BIKAPQ+KdxaePFfsJ8Wr750zDZ/b9/2e8nRdNtRSL2vHK
	ilu0uyJCvdptf/b0F/XOoAeJ6xiFDSUAmD37jLxBrDCzHjKiM5D8+Dyw1Tm6mxUe
	eP00gzUg+DDXKtCjwrrU2Qy8v0n2uLUUI+zlcXDo0bTZyytMPdkJzIfY0NpRUWnh
	AeRLdUX9BVaqHyOAupU+dvvckN/zUWo8tr2H5HLTNBGvOjE15+N3Jdf3MGTurhbk
	oe3hF/s/VuRt/vHO7YdDa74GShsJRt6exp6kpbMKpS5Q5YSB5JbA9anC3qqq9UvF
	fHYe+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnas95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:31:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso26239191cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759926681; x=1760531481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6QmyeNzk2DWtq/5un0rKTrn3/g/0gZ7LHuSs6FDi+Q=;
        b=nvF/fEVVXIkbf6mSpbbkDIVknIDTz1Ink+RWhdQ6nJesrvmNzRK7/1HJmwT2yr1QzJ
         ZTUI94srMdE/a3UJSCuDvxuHhJeTQlpOYpn9UTkiimnqzUO3sK5pTJOa9iiVBr/nDisg
         pXfVWdWVzHcMHSqhX7YrwSuKU2F6XC5mNqxJ8Xf2eBYsazLBvI8mD21vmaxGDkrpl1+5
         SrxSXCse7CNXDE9ZhAs9YWcWgQEKCc4mqH88w9Aq5YmTt5GnbirMKhgH+xsw/mWBzn/X
         OIvs8dnKYEpGMi2h/TMd3G7QRUrZ5qS82hT3s+TOeXxtqA7Az/FFSGr63bcQFQxKiLSX
         z9RA==
X-Forwarded-Encrypted: i=1; AJvYcCWvOZyMfCRa4W9eDInvNq41+bVMXp4LoWEe6+kSL3aWpR2FllCUIaU2hjXMhsfKlTL+uDPS/TaKVf3D78lY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1pzCg/3SyVkSntsDjAaTQ6d7lE9ACOFqpsLQwKnO9BcPiEnqi
	CJ88jYwHGEOgETXXae1thA7UT/6Xoa4LBwL+ExrBv09o331Cx3T2Sx/7KeFjz+cVVlhQrxZPiVR
	D4yRggKA5xtVlay5iJ6wruqz4ilBgtmDviL0lriPkXyiy03+E+FwVvGoYS4hhoVhRkCSe
X-Gm-Gg: ASbGncuUwPxnrKBRbfFymYfR2pyRL2fvFkfYyUiT0SmKYe0EHk8sd1qOoC5XBIuI6fT
	KcL4w1aBQmEs3iU3UdBLbo5/CVcbfeWyXlgBwsQ8+oIpSSGb7WlXHRJuYZaXI946C2sS8FIzxBq
	MxkOdiBLvu0fxCrMSFS5oLZ2Zd7WXcD82cMSyCwv3WZ7HNEvGFzCKJLZDyHqRUvuC4MYx1UVFhO
	QPHiyfyOwX8r4sWdZrXuGaYd360nA7kkiRd3Xzw4es0fius1GEuU3eLtp+d8cW0GBR13s+o4DJm
	28Q8N84ElvEhU1wnzR/cJNl3hgryQe19l8Km74BcaDOHz78QuaCHeYC+vpjyR8ZTNi3nZO3rmKX
	PVSI6/qXUCeoFoDFbzy0PXDmUNec=
X-Received: by 2002:a05:622a:1391:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4e6eaf1f297mr27572711cf.2.1759926681023;
        Wed, 08 Oct 2025 05:31:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4pwI1MduX8smavHYwiDb2mslV760+0IPE3g2CfsrQdd9P6KG/JHQdrqd0yDzYls3wRPT0LA==
X-Received: by 2002:a05:622a:1391:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4e6eaf1f297mr27572141cf.2.1759926680377;
        Wed, 08 Oct 2025 05:31:20 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f93esm1660139866b.83.2025.10.08.05.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:31:19 -0700 (PDT)
Message-ID: <eddbe8c5-56ab-4007-8df2-87927696bda8@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:31:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: ipq5424-rdp466: Remove eMMC
 support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20251008090413.458791-1-quic_mdalam@quicinc.com>
 <20251008090413.458791-9-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008090413.458791-9-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX4azXDrPAtpjb
 LWUOau+648Drdi+ZYLv4BptXEDZ3JNSYq3HhAOqljwTJ6QiLv7DgWy/EyKHJmAV9eWthF/GKdup
 5vpf9wfovo8ahu5tENY3sidYIpcTasVbKtj92gVhtuf+k0IkFB9hgYWUVxYqueuQdn7Ot5k6+ec
 QP6m7XdlA9USJti87miN2OAW5e5uay18u7X3STmj7JLPypF520jlDHQKmXfpt/eqS1+A+3c53iP
 XWSWy3bhWXl4vd0ajt5Z5q2lISK0KsXZv7UYtVpikKZfbvDA4HCVTwKF3tWSg1m7ePbj5ciEwZq
 Zw2xiP6vGbxi+fBgnRICGeLakQDmIAglS/MpcQNTgoUpAFg7r8opw+PxNcD+3N3AYgS7t2Zod0Q
 ghBs+iToizxogw4BTh/5i+sJnLOGmg==
X-Proofpoint-GUID: kpJruF7ADIn2aT8P6yF9OnBm6vXLdYCm
X-Proofpoint-ORIG-GUID: kpJruF7ADIn2aT8P6yF9OnBm6vXLdYCm
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e6599a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=be57XhxKj-X5Z9eHZJAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/8/25 11:04 AM, Md Sadre Alam wrote:
> Remove eMMC support from the IPQ5424 RDP466 board configuration to
> resolve GPIO pin conflicts with SPI NAND interface.
> 
> The IPQ5424 RDP466 board is designed with NOR + NAND as the default boot
> mode configuration. The eMMC controller and SPI NAND controller share
> the same GPIO pins, creating a hardware conflict:
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

