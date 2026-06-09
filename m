Return-Path: <linux-arm-msm+bounces-112152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bqHQKoYCKGrF7AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:09:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BF265FDE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:09:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Vehoqstn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PvUGDRL7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112152-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112152-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9963F3036A2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED8A286419;
	Tue,  9 Jun 2026 12:09:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A649E403EB7
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:09:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006944; cv=none; b=Hzh3vaTEkfXh0gjwJ06hQaUMcWuPE9FVU+LwmCDRBpmdoPHJAKRqfU+uhtIjon/e8+iRtk5dIhK0jyWv6Icd7VVihe2EOD0OzfVyrTsaWIqcC890vGWmI8nF64kEEL6OFIMIej7Vi+bA57qrT87pazeZNvAcTzcvPdh6NJNIBAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006944; c=relaxed/simple;
	bh=1XiWFLWsxujiQANn+NvM3ghNX3eNtkTv+Cq/YH89VV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I57S0MhOzp+1YpjCFZYcgppeuOHj4pfOfw8JJg7ue0kbvRK2gnjxUXSt+m3blV6CDAE5w3aV5CocV/7KBWG9GD/O5k/HkZfc0XmK1uY/d1JnDwbDx8y+pCXWK1ezksr+cZMh/Gzp9lvwW89BzAZXFOCwPeO3lKcryZ4VHHkHU8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vehoqstn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvUGDRL7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnMQk2574333
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dYYsHxVGk7Sj544332KQB8eb4Ow5NsC++ELEMmHpcPs=; b=VehoqstnJpt0qrV4
	8+bnw9wPALFYNur5hUGGFcu6Wtl8T1TkhSAXPivti7QD34bCHGvIPw+ocERkFD8K
	u/QQvImFA2xWxsd8v1e34L/fnpVGd5bwfiZ4ErZ4bBoXP8P3nCLNWQCbP4MeAH4n
	pEMSDeTM0zCi/IFgxCB2MVNtib7wLVKwt2kWMXJO6eupcJ3qtaFngGec09FUZC4n
	buR89V2t1zi4e5Awj+GWiRbXvKxl3+hvUmy7sedrkEveSfRprMaiwNk4fhmmeUXr
	53AMvzBUU3QX9x/752j8v6e9m5fcChrX0zmE7C6E6Xv9YMInxW6aPGUtFF/iAimO
	tBURmw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt0v5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:09:01 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9639e28bccbso5818862241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781006940; x=1781611740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYYsHxVGk7Sj544332KQB8eb4Ow5NsC++ELEMmHpcPs=;
        b=PvUGDRL7Fbr4jMGS9Y2A6cbY1YYo6VB7fzDi5cv/uKGlDl0YW9vMs0ymf9cUoNS7BH
         0RzPi7dR3rtFqi+ib90FyGHg8ZCB9oa54tlBYmhZjLEgY7/Okj0OLmtErqOp10F483+4
         oedYI59Hp3pQPeA41Q140G9C0cZieAr/zFboxJ35Y5xfL4iIwhuRIn9a50Uhswb1gVO6
         LZ1K/hl1UxLNSAA1texWnaPs05yZnLpColr9KkZ+0IxVtL67Gh5nPXK4wlZlCtkjVqAX
         /OSeWhTxFXFAUcQXu/Jdy/J6OTT3hEFUMfTqZ2DlgTYpLOMOxFAGKhDPHCI6B+4poyEg
         zk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006940; x=1781611740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYYsHxVGk7Sj544332KQB8eb4Ow5NsC++ELEMmHpcPs=;
        b=depKUG/uJ1FPKxHwacvdj0boRbDde/ZRIUy8DkSObeOc7KrGiugIBeUFDefLAEPuhF
         vgVHdQDJwpyrpvJwWw/Y89DCGzkTmA6nH+5nXi05cM/cyKTAjQwdlwC/MHrMLaPFx1lZ
         MNlSb3QHFl8Ftw0S0Ka/qXjvC3BGpTHRFBM/GS5CDutuRtRL87GHsMXzSI8r+LqXx6lZ
         LwI74suTl5giVJ2P9kaJLv3bwsAL1sGrxHoGstB5nE5Sccj1BOGPPpu+jcKAYpO6L7ND
         zSV76+bFiJ8iqpW53CF3B9eP4egv7agUrYWiwWy5vm67LJeohwxI1ghdhrW8+bk44iw0
         LudQ==
X-Forwarded-Encrypted: i=1; AFNElJ93ZdGw0EdRvWS1ukz7ZdH86XwbITDhiQppJ9G2ke7By06O1jXUSsuPxiNkggyeGEadf9vQ1WxdB19Grx5Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7S1JzAHFwAkrBHqFBnmoroJ85bws8msBIv6e2xKGBaZvr7Lgl
	jXLJ0VEvQcV+EPP10wIundSs+X+BXEP6TfJXYJOuasyXq9UoOCUcKjLA2miWRyPegdefRYbDWLR
	IVo5pZgvDYqJ9FrxbBtSHcmfJx53vYE5Ly6niRRTgU73zI99qZKCpX8SvjXdo8XqlCa6J
X-Gm-Gg: Acq92OEm2jJdP+XScmRoLYmxCe9C8Sxdb5VVja/aksc1Jrs//IURDn6DQg04k0ZOImG
	jeYrBY4992A+zN5dvNCPthU+IOpOkh2MUpHwwjzAHq7c8xYuNdvRETyoszU0fE73jvGb8Fo7NJY
	+oUUN9MyXWvvvJlX9fJ279g5b6rWloRbwn07O+N900unZs1JCnqgx8n6pkwYvWwlCUj0ciSh7cS
	g+aN0sbY2b7KKq0pbvrL+v6VpzWKWygewAQBwFIlxnBN/3Cw+/ub5KuBVDFVm4J+eWsi4sDRVzp
	O/i8RqeBGiIdsdQZPUWToi42BFVFCQ3HoYCOITc1V5CPdsLfn3xF9eLeosvbC8nZnZsr9YQntYQ
	KUIjn+9x5juw0OtABeME3EzTKIrqUQamvd6cXtBSveEyCdYtOraLkwoz4RWOcmuOTyIFoWJn9vm
	GaTmiJFzA+Es67LszX9Oo=
X-Received: by 2002:a05:6102:41ab:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-6fefc8b764amr10390557137.25.1781006940547;
        Tue, 09 Jun 2026 05:09:00 -0700 (PDT)
X-Received: by 2002:a05:6102:41ab:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-6fefc8b764amr10390530137.25.1781006940179;
        Tue, 09 Jun 2026 05:09:00 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:78ff:9b6f:a837:626f? ([2a05:6e02:1041:c10:78ff:9b6f:a837:626f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm64030956f8f.4.2026.06.09.05.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:08:58 -0700 (PDT)
Message-ID: <33fe758a-a733-4f27-8824-3dff398e1cd3@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
 <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <pyt62qpa75nzdatp5xl7vcqrdzmrzsf5ethw6wq62bzg6b7qtv@ts2v53im4bos>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SpEuJY9UW6CKt38PFHsZ1m-V7tue3F0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNSBTYWx0ZWRfX0ATJ063A4J4a
 vy+ouwne5wihMaVK7eJfxg1g8+0Gjtyxq9GcrgYD12VrYKhgqam6algPAunAm0JpYat2iMP+qTO
 v4m2Rd3ZqIBl8bE27mnHTikBfyuIiQUMwTKpZPcDj6ix/ms/kGkUX1yT8cSSZzMy8nIIsYmwESr
 BWMSN3Me3ceGHmM2WqimaNR+FXtYwODk/PSzGSERYZj2HbKfGsnHy4FVKZ9bpcF+A8ofbO7NTIV
 K4jCLHmnxbiJkdYkWO8yY5mFUA1FQW/wRJ+rAVQAhVXLXFSFSfa4xe32wtholD6pXuqeXIEmNBz
 XBpF0c0qn8+LVBhAQeId9uRSwoJc4RJvBWNUREBaYl5vCS3W7zr7SNqxpJUeydWqGfe0Kdj4VSM
 AAam+dcUQggdzD6r+MPD+antz7MJeFM3Fi9i9BpXdePGp7sa+NXjO+1LZn5gugc2+KW7ijIy+3r
 A/Ns87G2utacQtZMnUA==
X-Proofpoint-GUID: SpEuJY9UW6CKt38PFHsZ1m-V7tue3F0M
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a28025d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=JfLJAETMnmGwVqR1u6MA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112152-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82BF265FDE4

On 6/9/26 13:30, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 03:52:57PM +0530, Gaurav Kohli wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
>>
>> Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
>> cooling devices backed by remote subsystems.
>>
>> On several Qualcomm platforms, remote processors (for example modem and
>> CDSP) expose thermal mitigation controls through the TMD QMI service.
>> Client drivers need a way to discover that service, map DT thermal
>> mitigation endpoints to cooling devices, and forward cooling state
>> updates to the remote subsystem.
>>
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Wrong SoB chain.

I think Gaurav wanted to reflect the changes did a back and forth 
between us, so I ended up in the delivery path somehow. I guess adding 
Co-developped-by should fix the SoB but won't reflect Gaurav and Casey 
did actually most of the work. So I'm fine if we remove my SoB to fix 
the chain

