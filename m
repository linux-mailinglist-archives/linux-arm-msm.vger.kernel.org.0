Return-Path: <linux-arm-msm+bounces-92230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONGBBpGhiWlU/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:57:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4731410D45C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D166330013BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 08:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83E0325736;
	Mon,  9 Feb 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mas/vHPy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENkpl3/A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0C325721
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627468; cv=none; b=q6/O/Do+HZlkG49bEqSmNhhz9tD+AgeLC/gQoJpkfp3t/hp3q2gN3ryVzIUR6nvP3pUib5ENWiDVZY3oPronbM2y08Qu1aF9DoanqF27cD3NjXZEtPvO5VEMnx1DgD1d8CxtxxSm78GJBy3LxfgCTVOH6D0A5bbxw95VapZfor8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627468; c=relaxed/simple;
	bh=GldcBPlwVJKEip/JPTL6/izNX3WxBSNoIRJ5jZ18FcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+sAFA4YDmhIT8ZtmpGB6wH6FTKJZUisn9wpxVbCPtIm7vgMEWHiaTc5cMfEDkhDq4g/MFBgUMPMki7+zSb7J8LuY9AYTjGZeekUwGxfOSrTbVwyI1yiSWdIBcUCQ4ynkm/QWBFwrTwKRbwvzAV4XNxBsHWJJmy5OH3L8dM1gJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mas/vHPy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENkpl3/A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6197gFmI1928237
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 08:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjupU9AWHYtxk5T+fAWQX+xLIm/U2NqJ5Br0t3a0rk8=; b=mas/vHPymQByeobs
	mf7mVOXyBm3qhkGMosj9sZ9hOC65AHghrBFoJsJkjJVLiZ+RDumnSobpqaqLGxAd
	dODT1nkq5cvtn+vcJR7qpukiHZ3tIKynnDq4iqAk6KO/gpitk1BYizVN0F4iXdBJ
	d1GFhUYzCkBDiTANIhuJfnjIAQDdmARWa26eehpTQs070nw93hqr/wjSbAWAcCAI
	cFZMMLkl75RY5YBrJaEU3PNr8REKXrA1it6ZTGqAqctDSZkFtkoeRcA0D4V10CRd
	ElxvfOZXyoE5Y94txMFYQiEeJK77N7l8mSK08fjeVrA4/NqZjPdtgws/eThgmQVC
	FHneRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdevefy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 08:57:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c53892a195so69312085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 00:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770627467; x=1771232267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yjupU9AWHYtxk5T+fAWQX+xLIm/U2NqJ5Br0t3a0rk8=;
        b=ENkpl3/Acx00VwhXikKbW+yMY8Ymzsai0pPgQRNbP8ivR0aW05V5DMPLSKtV4srjZq
         68g4rmbgQ5eHF2Op3+ScbLfKEnDFP4Xu4RTZ2CC5Gm867qF6Nadg52WhSl8UgvRlmemJ
         0qUnQQT2Z0/53iUqYaKdcEtA9eV1mumkelEGjN4DUzkGj3uWRXJWe98V4GheBGahjX5s
         DHc4+B0LH2+zIoUP2lWo2Il6nmnKHM6+q6zaLojksWewmvotBEODbZ0z5iIFjFQNGmI/
         jnGq3HfAcj6T5cpJFFk6mUyNJVMqCfVW6uXB+MtgQN5eyVnUz3LPHllsN5zO9Y9ke9kn
         YlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627467; x=1771232267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjupU9AWHYtxk5T+fAWQX+xLIm/U2NqJ5Br0t3a0rk8=;
        b=vpFT+2BWf70HsTnyDo7lc34Eta367arJtn/PEeSVGuuO3Xe3IzeyQ1TqJBhfLEpJo5
         j4pcz9MH8thSEwnMwV2cTIK+vyOBGZmXQTfPCz2HScuVJ76RyZ4ecn5qYaEYNUCwZa7E
         mKaVGxs06GSx5+maEVkH+nwagYH8lh33JSFfmHh7hOYHZIx3qVyxyAOVunkbEpCXmwf4
         jwiSheKTdK6QX1ByN5QLsSobzA3G7qjStRjsCghoC4qrCyawbtMjZWbCxm+auU3cswrN
         eTQ+Oiv9b7rG0peiTNY51rwqs/gMCaKaj1fIcg4mAoTFYUAvgRdBH3X27jAMJpJoADed
         ozhg==
X-Gm-Message-State: AOJu0YwZ9zZtlwbeBoPZ/rdUFY/GgvBfEHWjGZE1OoxLgUSYTOsPIn7O
	F+nYYizOi7oRK1tJWgg20MH6+ao3LSJgABil1t9vguEmoSH7IdsjvW+jCKypmdK8mrNP7ULhmt1
	1BNnsE3gbQdW6GAzeYoLwXteAAoxqwTNn/+zb4zkEJSq3GTelx5haVufPW70Gh4qyGf7w
X-Gm-Gg: AZuq6aJz+/0hXabPrvNcS8aqfaUS7ttdyUEW8KTaLkhTQ3qHZARNStoSugT0/rKM6ax
	4RgaApG7euXskF3lx+Ir2WT7aI7uofPocmjsO/dZInAg6yD8BKhp8Qmnc1/QTOlmlPWmKPEpFjx
	fssNQr3Zn3zMQhSg0n3KFgTWQU1zu3G7gKujrjBUZkz80DX74kXKOSf51G90UfZ+3H2QWI/SOGJ
	idsNjFd2P9mfHg94ZRQhTxAHrQU5MMqk+r1JG2UlYRw6WTN+UquuZRxXEugnc1YqQ9/oxNxN6Xi
	M+LPR+3AJGdf/Cyz1PS7DWJmIXrFEhElbZeVMGez7pKf6McHls08+YEfhyH9zUaEWGDFgtTTBVk
	de8E1EpeApmW4EU1YOPXpiYpMNlprRp9Yuiu4ltOyoc1+0Yn9RVVqLU4j498C4NIYzFU=
X-Received: by 2002:a05:620a:25cf:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8caf13ff1demr1112747685a.10.1770627466878;
        Mon, 09 Feb 2026 00:57:46 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8caf13ff1demr1112746185a.10.1770627466425;
        Mon, 09 Feb 2026 00:57:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a3045sm368801966b.22.2026.02.09.00.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:57:45 -0800 (PST)
Message-ID: <efac4464-6bed-4507-9c7b-a95863f15213@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:57:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: x1-vivobook-s15: create a common
 dtsi for Hamoa and Purwa variants
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maud Spierings <maud_spierings@hotmail.com>
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
 <20260208-b4-vivobook-v1-3-3a9b5e153909@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260208-b4-vivobook-v1-3-3a9b5e153909@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ddcaa/tW c=1 sm=1 tr=0 ts=6989a18b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gxl3bz0cAAAA:8 a=6aO9SdsguKCRYGpIm_4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: _B0P8VmHztTcRW4W9RjFJdDh27LGhezN
X-Proofpoint-GUID: _B0P8VmHztTcRW4W9RjFJdDh27LGhezN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3NCBTYWx0ZWRfX+UL4rszv8wxj
 g4KBjidu011PNwD5ZERNqs9HMFj6OOw6cbuec5b4krtlXQxmiPrxfH8D/tfcwKuc6p68KoBS2R/
 tXZ+0gxi5gF9tmXWJFgWsaY5SVozKrT9QcG52V87oJZKADFXxGsSp/0FMmkanTYt22xwU66ZZFA
 QbBTGKE2N0LpuREih5jmIM94YbZTRlUX2KT6G1uT9aDkBhhYtSYt11FakE/aT3hB2aFyZtZCwWg
 EQRZeb1xdqljhPP7bFsBiJCabAMk7JhaILxs3tSvpBUPKs1PAqHb8UP076wy1uz1wTbIMY3xHGn
 Rtrbe3NhgUhcSn3IBARGmb346cHrFYa5sDN3bBz2Fxhnd/8XRJ/GEUC984Cu6lavrX0jT9ttvWI
 wkSzjccA9bo97DmZ4WD40jVK2CwW0MVDPSaWBfdjBRSE/Q087OcUmsHVO2+WOEyBl66qdOGfTea
 H/urQV2fvrXMcbXyogA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92230-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4731410D45C
X-Rspamd-Action: no action

On 2/8/26 10:25 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Asus VivoBook S15 S5507QA is sold with x1e-78-100 and x1p-42-100 SKUs.
> Put the common part into one dtsi file to be included for model-specific dts.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  ...-vivobook-s15.dts => x1-asus-vivobook-s15.dtsi} | 28 ----------------------
>  1 file changed, 28 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
> similarity index 97%
> copy from arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> copy to arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi

I'd expect the part of the next patch that includes this new DTSI in
the hamoa-based DTS to be present in this one

Konrad

