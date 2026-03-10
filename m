Return-Path: <linux-arm-msm+bounces-96564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BFgCQHlr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:31:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9124875B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75DF130A9AA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B01B43CEF0;
	Tue, 10 Mar 2026 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glFOLc4p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUx3FSwB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147D1439013
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134258; cv=none; b=kwyj7fWlFtMvF2kVW4mJ6W1lzHj0yp8TCr/0p211fq2fb2mDjSw47RKD1KIa2uoo2nOAxSUT+s1GHEiiE2wVmVPgazW59CQa/LQzHiRYeH21x9eqZ/jSCAqRvgsrAMf4FVKrXfy/CsLF/v8H7h+2Pd2R9N7s0cOUiBW7575Sry8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134258; c=relaxed/simple;
	bh=7h/4Yclabk6wNHjEMn8MKHlsK6axtckYcV6RVrETjhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpmvC9f0mKM1Zx47KEun9J1Y15K2B59w3BkXj2tI757sStAiLjUqakSkh/oxbjtun/aZ8DvAZdUkeZd4J7iYTGpPIDAiBI8fhcmBhUpcwEZwx5hEp6bCi93s4E9kXIsrHC3fxGcvSdKNEXo9W2h49DE+EYjt1a0CSFVEVuGcIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glFOLc4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUx3FSwB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wMAi3124506
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MYKZxGiPOu8ZRtoTFNtUhc1HBg8grDgGM38nwNBDDM=; b=glFOLc4pUhhSufGG
	juOzFu75rc2eycZS0BawFPNeOheWjLjQqwPfSIlWmFiucB97rPJ9LQL9Cp/cSNKv
	plE3YXEUahfs8RsU8tJnFVxsW8HSSA8QCncdOeqmpLgykMNwg/ZpGVNTYFwJMFTB
	sOfgUyOQqUvP3VCWbe4/frXJRlqlmXI78YYiso9fsTdmoooLu18yqfRrIh+6ewMC
	y6JmSp5/Yg+ju6Rg4B3eIkfq1ZO0I1rf/N7UlPE/Burl2cqn4TmUeQZQqS24JPTv
	4Ezx3oM85QrMXrvNGpd4BpEp9S+DANv5eAH6evKzJTiOCYDiF+0tQlMc4iG2XIrV
	AEIAeQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0a47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:17:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c709551ec08so46326880a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773134255; x=1773739055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MYKZxGiPOu8ZRtoTFNtUhc1HBg8grDgGM38nwNBDDM=;
        b=UUx3FSwBQAK46aRBrscVCeekqG/a1mH2gFRpV68IvxXS44bNHOzgtHAvgd5/b+f8Vh
         eNwGPB3Re5zN08IvmAFglFi29OgwCGU2PU9xCCSBCIEKobNudI0Rnm/lFn+s+6B5284w
         pvvczG+KGg1N61bMcTKdyinuA6M9f43fvYFJTzpGPG62cri7XaswOMVYHAtzP4/AwL/f
         xjTUej5d8bgR5nqB9xoj6a7KmmIH5Pqy+3D7bEN6UNKykVIUiVaATk654P5DD3T96q4o
         UZvNsgoXmPkTPA9l4+ySRkLW6oNit+Ddh+vfqEdel8dNSnhuTmQROYiaY/B63x0feRak
         MU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134255; x=1773739055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MYKZxGiPOu8ZRtoTFNtUhc1HBg8grDgGM38nwNBDDM=;
        b=uk/M1eVvWI9MzkL7sQPmWaJY/GueYbbn9GJ27juw3UZtUgOFbKWKyc2a2MHnP0siqt
         3vqkWn3o9+upuu7xRseJfvtye/J0FkqrsZ66SbbQK0eDbGlnpbVj96T3Id4QEkEaURTn
         F1t4DzGALoRM8ftuB8gNtDeZ5/8acloaaYhNqikAVII5qp1sE25gngQ8jT7OFq0wwoWq
         P8PC5ni48RqfYv7FFwuAUTe2mbw+k0RVxblL6Igwqgw+wRvGFaqquA86OLC4r8HxpCR/
         Rwdp0+X8gI3IYLLgkKmT6o0s0n0ZGU0XC/uhuK7IYdHUHBfy6OWEOio2C8JRWRyCGCIt
         QP1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW97kf795XIIr2gTbV7VNPsWLj7ASm7rZ5+MmtMsLvjaU9spYpqp9u75lebQ1495GkkkIItLswnQ2iNmNpU@vger.kernel.org
X-Gm-Message-State: AOJu0YzB0UYSrwpMF/GmPGNdkUnvrEyHsjPjIAWC5xWo3bPZOwitraPm
	PnkYtltNSajBg1eiwSPo6qlLipAxRxWX5wjz1mV66fYy3v6/akF5x1qSxYM/KxYRPeoKFAa8X7C
	FnyB6uKQvTRuYfar+dePIiH6+JQWXRhMQqK9chI3qhTvO5i5r8ktfIvN/pdqZIof5aSIx
X-Gm-Gg: ATEYQzwf60KrCY2C6P/qGKnvmqbDIonZwVP2u+qVY8fZ1eafXninozyq4yAu/hnZP94
	wtwk0ppRp2ngelEqujTFblBklGYV4AZ22Gqs0IXhzCEn2EJJOYybbNjyh0duZEqriSjUQiKja44
	JyhXpeFBD5t3uVLkP7c1jCLYY2R2gdfbum4whowpFQid+5pBxQYCfuEw3mgyhX5jqvv2r5sTlu5
	Kgk+W6LEVKYH4WdId9NMrCA1itinPP5Y0IvEUWffll2Zvvy0bum6v9fDnPsoM7y9+LkVIy2ju6g
	PWzh6zhbRQkEkU4IVfPupJ8zec/05W7zTsObd97FwhlUmb2n6Tt8BcqR529yJRwyFsXaNjeFVea
	YO+dtMo5G2nHFGD2wFzEAwKtDDIVlvFQBuKCktMXHdpWT/FLCmrgg
X-Received: by 2002:a05:6a00:3d13:b0:81e:af19:34bc with SMTP id d2e1a72fcca58-829a2f79879mr13718890b3a.36.1773134255112;
        Tue, 10 Mar 2026 02:17:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d13:b0:81e:af19:34bc with SMTP id d2e1a72fcca58-829a2f79879mr13718859b3a.36.1773134254666;
        Tue, 10 Mar 2026 02:17:34 -0700 (PDT)
Received: from [192.168.0.103] ([49.207.195.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a467239asm13388147b3a.26.2026.03.10.02.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:17:34 -0700 (PDT)
Message-ID: <ff5a52ef-7a0d-422f-a62a-6ef812d6b676@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:47:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur ADSP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mani@kernel.org
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
 <20260310033617.3108675-2-sibi.sankar@oss.qualcomm.com>
 <20260310-translucent-almond-herring-f7acae@quoll>
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260310-translucent-almond-herring-f7acae@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69afe1b0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=FDuvZuZHjihTmU/CkdNO9w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XJ9aKg8kxmvS5VUx9gAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 14-pqrD--422x2s7mGfNnnFuk8B033-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA3OSBTYWx0ZWRfX6Fpx/nmIVOYf
 xbRPWe5qjiEOcNeb5K6kcuzffXFmqQL7MRi4y+nK3h/h0E/uR+kU6XSjUgbdwCDxDdUDLM/SDo4
 k8rZrNrSxXa4xRmS0/jYbZWWqST8XKjqfBGUP4K4vYNBb21mXwnCDz/Qv+Y9aqgWSSf4xTdjSwA
 /+ORKk8lXUo/OH1leE+KBHL1gFvmULzQ36xFQ4EILWsMN5U3dF03OwlJs29xxGZohNhlPbS5g6e
 1i2YkL0k1jZWpb/7aY7QbrxKICn5DiJ+G7W+pZ5GabuQ906fCzVKD0RDq0SkhjtK+B4RZBJaaQ1
 UcmRLgcmA8DFmeSKMa0jR6Q+DxkpmugSbm+pE7y2zUTtKMYQJzK4GNznPkIZRnkKPEpaOLT5Tqc
 kZbjWtqIeLTs/RtbjvrX3MSmbK1j3TWmrkKQAv/IxxvErAAJmpq2n0Iu63AXnQr+tLb38PLaxCs
 +e+TdrP/cpYcnamwkew==
X-Proofpoint-ORIG-GUID: 14-pqrD--422x2s7mGfNnnFuk8B033-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100079
X-Rspamd-Queue-Id: 82F9124875B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96564-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/10/2026 1:20 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 09:06:13AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur ADSP PAS which is fully
>> compatible with Qualcomm Kaanapali ADSP PAS.
> Kaanapali here...
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index b117c82b057b..fb6e0b4f54e8 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -29,6 +29,7 @@ properties:
>>             - qcom,x1e80100-cdsp-pas
>>         - items:
>>             - enum:
>> +              - qcom,glymur-adsp-pas
>>                 - qcom,kaanapali-adsp-pas
>>                 - qcom,sm8750-adsp-pas
>>             - const: qcom,sm8550-adsp-pas
> but not here, so fully compatible with Kaanapali or SM8550?


It is the same as on Kaanapali which is fully compatible with SM8550,
so applied transitivity to the commit message. Anyway will get the
commit message updated to reflect ^^.

>
> Best regards,
> Krzysztof
>

