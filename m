Return-Path: <linux-arm-msm+bounces-91645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCADIaLEgWnZJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:49:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D6D7146
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11E4130DD941
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D09C399001;
	Tue,  3 Feb 2026 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIQVJa2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcyPFcO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA1339A7E0
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111898; cv=none; b=s8Dv4M35cyb3gHeopZG763TQfKab1Z3dbBSfWYeMoQPx1PTWDdS769jjouq5qrhaUnDg5XaUEQFEuL+6FbcgmbM+HkHl+7glp31iBWEjkvLD8pHnYXxwYxtkFUzAlpmOyK2G6FNh6wzlm02ZJ3EvPCfjbAqHf1ukjFrNnHzUVJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111898; c=relaxed/simple;
	bh=8sieABVkq7a8uU7GMw2FdM4DZGO8ObwJRGo4F28ft0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udSh2AjsWhej0O8pticriC8OEF+NZYltC/KyPZwVQT+bK8MAt5Kb1kmS/4yq/yoxiDpyGXoRPNVCrxPQ1slxqTfcpfdN4xWuu0VlQUN62X7b4cjMLDbByRUyhuakCaCosGNCS1100MytYb96Mi5ZsL053SbVsrpeFN1XcFhz6e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YIQVJa2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcyPFcO9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134Ai5I571041
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeudJFG7LiMKodunMeeL07Kfaxiu1hJuoyGKQB6SV+U=; b=YIQVJa2+a+wZ+wK+
	GD9B+rM/77a2AKdlV7pA9dhGKQgPwPAKOjsOzKYmpFxj5pHcXK3aqBI3DrrJF1tb
	wOuMGyY3wb2t/PPQfTAaETIlrXrDcxVwh+8rZkLxC1mwA8Aq9HqbdXz979+jmIOY
	xKK/AxlEbqc7fQYkFYq6Qrmh1X3M5/8NBmcCvWXpEJBeXff7Apwj/xuCxhm/ChEl
	MQMDJhm7Co7IOqkHpYUzKRiNy+FRbEzQM+T4KB2zyK6iryw26u6ankLmN3N4vRCb
	nkOjej/CD93hwDD0A3AxfZnhavZ696kuop3CgZ5Jw3Am2n9iT2FBytkhhqnevDGG
	WDuhtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmkugw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:44:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e518fb75so47082885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111895; x=1770716695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeudJFG7LiMKodunMeeL07Kfaxiu1hJuoyGKQB6SV+U=;
        b=VcyPFcO96QHpeSGo8p9ZJwxZtaZE7D18yDQCauKe8BcCHXnFqaIU34ZdfNZ2R85AcL
         +fImcN2q2iQFcRmqG7NZz08wKQrGHqmbzN4syl21U26r9Qe3ZmdO+WKRu23LUyJC0391
         GlmYOkGlGVt51+gS1lOkrw0gVX27RephgUkwNF/y4a19IeINoFJzy/5v/yhS8t/+suK5
         X9PkZprydBQRjJ+2Lii/hmQLai9kdidL8zh2ymPK5Zvu+Vq6Wp1ZTgYUpxNRyh2wgu2p
         yhgET4DRnUlyx+T/Miabze56vU0HIh0fjXBbzp6Sjk7u4kodZGFDqo5pak7EVqij55/z
         Txhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111895; x=1770716695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeudJFG7LiMKodunMeeL07Kfaxiu1hJuoyGKQB6SV+U=;
        b=dOEs8bnIP1D+jzYvUjbpxygsB9vq5JfG8TnT/PhDvm6uc1Tk8QyQqPDO5nyrj6LG0u
         Pfu7h2TiF4EBCTk5zsGhmuuW/T6GPsKtYRCxNOhj7LFcCUEHvn7OQRepizXNjerXBveB
         CxkfdWnGAFY1XNOVm43tBI3ZIWcBBL00BurQIP+DDCnWVYOJGdeMgCXW9kUxJ/BbukUT
         sg1PS5rphVzihxqAjHzQaYNydexP4XXL2dvJ/2Z+XbtF5sTASrI+ROEAhIe13dSHdV92
         AFs4hxMX/qZYpc9PRFvLufR9rgf6Q/R2kqQeQ72woN4jzoExlQx2QhLmac7s4KVAl9pR
         z2+w==
X-Forwarded-Encrypted: i=1; AJvYcCUcYaq9BJnplVve7eRoBh+pLHlh55eAZLtIjXlYRS9XigVPb1ZbMdAzQVAUta6R99gqyXGwvSbw6cNeNHw1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa68xNzlcbJhXoGAHcpda7ds09/azjheZLL385s+UkuyR3s8vy
	BZAWoGy/pICddBC7sbzjkjWCnJ31J9aTdZjc1PYNKpPwjgoegu7iFlPuwlA9bz51HClTNpHVC5U
	6FG2BAN0hY190tPDGwd0iOsvbbH6XRriuy39fxTVQ9T+BbMVrCZvOu/9AlCB81vt7PneV
X-Gm-Gg: AZuq6aJcizj2Bh6F+RsMbt4t+em2PNKA/2hxNTf87KFRKIeVN0DGTSPWNjhGjQJ6PGg
	/oujKcySVVv37GKHnAuv+W4GpKuh0tq6LvOeW++ogUXMixFHbCwbiZAQkIaD1wWXwwTrNzhVNk9
	NKSM2WAxIzyZe2KXSQ6KVmAeuFoetQHJ9rU1N1so+i4UE6RlfBraLU2/yKs/qVwNnH2iY90fLpa
	8OcXaLuMgVJWHskTn1GJvkVcrDUT6dNTBrH75OrS0nS1Cxls/nTWBrVDepWVqjqo4an8S+3mVC6
	mdpnwjpGSpr29z7EHtWeWs2t5W5E4bePSjCLzRDyY6dlu5hJ+LhVCzVvE1PZYJmdCnzUh1bU+QD
	hgB27MIr0oz5al5oDmCUMCMNx2kDQfYxluowMrpSfS9d8UfX+ERL7jY2AsORZ8xVIwio=
X-Received: by 2002:a05:620a:4503:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c9eb32af98mr1422220185a.10.1770111894746;
        Tue, 03 Feb 2026 01:44:54 -0800 (PST)
X-Received: by 2002:a05:620a:4503:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c9eb32af98mr1422217685a.10.1770111894312;
        Tue, 03 Feb 2026 01:44:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e04be76afsm679879566b.36.2026.02.03.01.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:44:53 -0800 (PST)
Message-ID: <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:44:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6981c397 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9tshIx6OZwkx-PAztD0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ICJ_DvNS5Zs4osTCZ8cbjX0bhOL4oQVB
X-Proofpoint-ORIG-GUID: ICJ_DvNS5Zs4osTCZ8cbjX0bhOL4oQVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NiBTYWx0ZWRfX9z26kmS5LqI1
 7Wmp1z+4a3W5vbh5Jmty6PlU7l0I83+Zq1VjslHpuWmwBfue/qMq1mqor/ajuxsDhSfNpbH4rDs
 nfj8FigndYNO5aOKrx6SG2Yg5wox3EgU7FJh0UzBwNR2588uUh7vgfUJSCGt9fUaKCdPIJMtppj
 ehZEUXfLfsD+JABP+faFpiIsk4n83RI5xVpff7w26u4Qu0K4KePAwm3IdU1YV54UwOVnSgvxCv9
 2BVlqem7otBZ2XgY1aAAlvzkEn9ICWFXhm/n6xkR8DND7LKA6+sY8P68EnmSBAT1K2l8xlwpXdQ
 GFW79vo+PG5VXkP0bDz5byvGWaCOr2A8BH1aPPJ9hez/VZ/2cTsEeUyg2efZgAYbjq4vj3xHcm+
 R9J8Oz3X4MWUdfK16a6oiSZcPKZLr4OPC6T1nk2iW0ld0lghFEv2RmXO0aaRq2svSRRXAaUb63R
 D4kckcTv58QMo+Ct4aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91645-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.152.154.104:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC9D6D7146
X-Rspamd-Action: no action

On 2/3/26 10:32 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device.
> 
> The CTCU serves as the control unit for the ETR device, managing its
> behavior to determine how trace data is collected.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 159 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index db65c392e618..88ec29446ba1 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6771,6 +6771,35 @@ data-pins {
>  			};
>  		};
>  
> +		ctcu@10001000 {
> +			compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";

Sorry for not pointing that out explicitly the previous time around,
but 'hamoa' also falls under the "had numerical compatibles" category
(you'll see the only hits for "qcom,hamoa" are "qcom,hamoa-iot-evk"
which is a board name)

Glymur and Kaanapali are, understandably, Glymur and Kaanapali
respectively

Konrad

