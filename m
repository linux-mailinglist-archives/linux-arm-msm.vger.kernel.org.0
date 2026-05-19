Return-Path: <linux-arm-msm+bounces-108315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EMzBlnhC2qzPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:04:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB771577159
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 06:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D65D302065C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 04:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256602C0F93;
	Tue, 19 May 2026 04:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IC7Pgm1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJBRaieD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082C2F616B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163474; cv=none; b=CkHHMWw6G1namSgFNjlfU0X/kVShuPnPLX24khbwxN+KFgTzNzM0A+CgcFwwRCgIrOJCnDSPUd/VAJBHiVb21qdg/bc/Z7OtXsWXR7yzZ00C7Uce7taRxS+XUU1N/bSA1JTQHwCQuSil9ZxSGn+Y+LC+ebvmeKRX8E8j3G4OCbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163474; c=relaxed/simple;
	bh=3r0KXIvqch/qW3DQWjqE3BQuHzdblo4BIE5pGliJ9ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8x8mGWlDc1OGqHJGCCZSJCr9OvcFQ04MTPHLCRImlZV1jfB4eqLHBlsRBcYdrJm8TrHCXQ98tnJkFSo380v93E2+J9yFDbdXU9ct0/pVg83EyXBN3Fz0Xv1T7TldhI9/T+8CuB9MVpRut2s4nZ2qnqCxNC9jamH6+T3uVJpkag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IC7Pgm1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJBRaieD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J124qM2975689
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xS9AYhs6BDbjLLGh5V14QRqWR+Wq85qVhy1t5hgItDs=; b=IC7Pgm1JUgS9jXP/
	8f9VWCI2RJ701EscmlDPM/6Q2kHZTk8CImVS3tyRyvEi6A6bFriq3Ufyqqa3yJ+E
	/vUdWplIeQ8h0NI6aluja2uG0vGhgIreQ0rJHxDVQ/kSmpcTWk5bv//J1KBetI64
	fdpRh4tLLBNTY2lQ+GCE3AAR+QA26RY5ujA520t4D8cR/MYV+y20j944cLQ0yw2s
	MLU17Fkm3snvJjVeRwyKR4M4lEnE7HzV6/rsIhpHMO1unW0BcMyhrxH8E4QzcVPd
	Bwj00QScAUnNAVb+y4KWiYsmAzM0N6QZis77+2wc7zTsuxNKaFTRkkYcB7iozbS3
	TtXPBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4af0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:04:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so2870400a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 21:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779163471; x=1779768271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xS9AYhs6BDbjLLGh5V14QRqWR+Wq85qVhy1t5hgItDs=;
        b=jJBRaieD5OVgvQZcF/6WWSFKvxEg3tjyqdolfCxewDmNuVRhY9nkqqu7Vhc4CjY/V1
         ewmjBRrGCv/jCowX9WhITIT7jyEXZnAuHCpn8Go/Bu2JdgYgSiBmBxnVu2L5jgBaOA5W
         uLaezOTFQyajCoTiwc9zMLLjCHR33mW5zuCUDeKCPQ9Q8VK4bHfbuipalDRd5ELqPXn2
         uLU+Is1/WINGLKlzONhucsJSohiUf3DNOiJ+NBY41SdnmcqKZ5GEE3Bg5dJPr+lW/Pv3
         /dX08RetBlK2CmA6o2cdpD9dvO6NaUQ2S/gDyZKdBx0SdXy7myoN0mdqv/7r4VUvIwO0
         pHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779163471; x=1779768271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xS9AYhs6BDbjLLGh5V14QRqWR+Wq85qVhy1t5hgItDs=;
        b=YuJ5MYV6EL2MojicFLA5+jH7gLVkYLQKMDVYFPpZcHAc9/DVfb6BV+6hcG8N4sP0pk
         FXu6ldaA2WpnEJbxGfVPn7iYs34PF+ZXlwqCL2G/T0/IOilZuJyPYu4DB8oguquM3sRH
         U8gBjFDMlMell7EOcHN4sTInrsc5QwYiBjJ/lCviQbDfC8wm8gauCzT3GohpN1sqTxVt
         d82Q7Zjvq6pBnVdifXYKhx8INfM7OLRNtiGpFhQasSHZS9WFPLWpD83jVS22DHFnMUa5
         g27tBBS3+fLMx9dF3zrKfzLeuModo2mYLlbrBTV80E/p/gTaA3eW9jbOBgVw3TCTCZw+
         PlwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8udmCoKR6r0YvrSp86nIPe5UjZPKh19dfsORy4ujzESIBGoOFPYKS4i23L7ZG7N255JSM8ufiTvra8pP1N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52xMkLn0Cv2bgzAJF0Nz1mwzgzXqaRCqnz9l11ve63Mchb1X0
	95D/e47CIYEj7lGZnCqPDBa3f+4xfaXnuwCfGhkZHttUB5Fa2TZq5k4CAKqr0q4obkPplnvr86N
	dvp/zGTb7KCNcmV1tppLC5WV8YEO3kQxLLUp22Lr3TVFM+tCf9Ypb6LbcmYmgit3Ch4Tq
X-Gm-Gg: Acq92OF+Po5IE+SAnFjssUDMbK1iFru8rUk6jpRinLh0IlyS07xFMmdqUnbt0jZJgBJ
	h3Ot+AseyS24kTKKI4LFila+7t35qsnYitAkYolb+SbAeDZY0cLZL9ZAf/QNSjOKU2ZysznD9jH
	xvoAvAEth8hgg6J867l416qif1+K41mJ8zuHvGCWvqjPRiazpGt5cOrQ7glJ8o15LDlM28VLGrp
	uqXXbg7lLI+M03hs94j9IxqHtM9YL4g5i8T6mquTEOUSX7X4gAUTQVOOpHIKjafKshloJdYBsVx
	fobE42kpOt153j7muXPsslhp0r7CJ4ohrPXKMXfeFDdMUTi163hmUWsJpnwannft+7sVKGwKXOS
	/ml2EmGBxN+dWfgNLrIgsL8mgJTM34q92xF7i07H9Nve0DJ0V
X-Received: by 2002:a17:90b:314a:b0:366:3517:1a95 with SMTP id 98e67ed59e1d1-3695173c0cfmr16415385a91.0.1779163470845;
        Mon, 18 May 2026 21:04:30 -0700 (PDT)
X-Received: by 2002:a17:90b:314a:b0:366:3517:1a95 with SMTP id 98e67ed59e1d1-3695173c0cfmr16415358a91.0.1779163470352;
        Mon, 18 May 2026 21:04:30 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369703bcc91sm4924387a91.3.2026.05.18.21.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 21:04:29 -0700 (PDT)
Message-ID: <1c0bb8ff-eaca-4779-9b2f-4d564abd8670@oss.qualcomm.com>
Date: Tue, 19 May 2026 09:34:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
 <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
 <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <qg2n6pwjcoz7262eylept4mec2l74h2owfbhjykfxap6qwgzuq@oawiwgok4hhi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0be14f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LhgfjC5gSqSb7UNhMDMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: VH-D6H_cL_y1LYTiZAF7UEuQXB1aex4H
X-Proofpoint-GUID: VH-D6H_cL_y1LYTiZAF7UEuQXB1aex4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAzNSBTYWx0ZWRfXweXJufHhXUKP
 ZB2/is31dazCwHCu3kGVMvuiSwL2OM/GI/RB1Ag0Ra8HMeeD0TwuIA05paB1eTzhAeN1iY/xKal
 BZseVvTc3CjtHqSzSA6xqEDBpVCgi4t7cuEHXMDlWhfuNsTFlV+ZP6vAiL6idCy3rZ1uz4ElhL8
 +xkZIcRG5sBf2UmuZi+CwiOnliCExt17c7YJ0kF43+6Uvs/z8HME2vP8jDw3g3EqnMxP4X6TwtE
 CIkQHn3XFjilXTDYJqZ3FQNArFGpW43LZMElBspoXLnpiwLCuGxhh822kMK4PJpem53lAINzN5h
 6IJ8cj2K8KaA2DJ2p1zsYPXR3JvCnzoTTGsdy7WKrIjoS6JUfpFdKjCk3jGRnI829+46dcTVncJ
 ckjMYI5D6lFbaMw5DdsIaftVdBMkJY6lF3C5Qge99SqqXeb+wz5zj6a5LS9Q7REke9E0h3w/CTh
 zHc+u2FdRQZnXDohYVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190035
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108315-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB771577159
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 13-05-2026 08:38 pm, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 04:51:03PM +0200, Konrad Dybcio wrote:
>> On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
>>>>> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
>>>>>
>>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>>> ---
>>>>>   drivers/clk/qcom/Kconfig         |  10 +
>>>>>   drivers/clk/qcom/Makefile        |   1 +
>>>>>   drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
>>>>>   3 files changed, 576 insertions(+)
>>>>>
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>
>>> After comparing the files...
>>>
>>> Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
>>> clock-indices, but I think it should be fine to use clock-names as a
>>> one-off.
>>
>> Or we can convert it to use indices, since those are stable for agatti
>> too - the names would remain in the binding, just unused by the driver
> 
> Either is fine for me.
> 

Hi,

In Agatti, apart from the clock-names difference, I see that the AHB/XO 
clocks are not handled as always-on via the probe and instead rely on 
pm_clk style handling, whereas Shikra follows the newer pattern by 
marking required CBCRs as critical during probe. I think that attempting 
to modify this approach into Agatti may introduce unnecessary complexity.

And the Agatti DISPCC doesn't have the DT_DSI1 bindings exposed, and 
updating this might break the ABI with respect to bindings, and DT.

Given these and considering that Agatti is already stable, keeping the 
Shikra as separate GPUCC/DISPCC drivers is better to avoid the risk of 
regressions and complexity.

Please let know your thoughts on this.

Thanks,
Imran


