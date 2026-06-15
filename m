Return-Path: <linux-arm-msm+bounces-113251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BfWVKCI5MGqbQAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:40:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0F688ECC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:40:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j0pG1wD+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T0q5QVu1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113251-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113251-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE4223068EB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D4141C313;
	Mon, 15 Jun 2026 17:40:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AF241C2E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:40:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545211; cv=none; b=IKzNJltXqCOf9W8lFD6IbZZVqJX9kpg7pzJ0mlbpfyYeCKQr0Tr45Kd9dIpWgPMRaBnGlQsh3HmGQCxu1cMrXKHBx07UHVCMTJ4qiDRu86FlU4W7O09W7jMSf+GUGvOg2R6veGXaSB03wUwflihh7oTbyXzkx/k6KkGfRQZ/E7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545211; c=relaxed/simple;
	bh=cgDCf60D1ZNChtIqUC1HmxRm6m46wBrGxdjrgS0ByM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvEKDU3FyaeqXf/MOssgsoTjYNKA1QfZVjLjorPRq3jrvvnNFNlktP/nZT9G5DS165mNGb+oJRYjUFB50e9fzoH8M9wU/e9svz0y4SemOa0Y/OIEyXEi3yw9Lr3VbgYvW/l6rc2XAV9R80VaXJyVOGRYaXNVKi+pB43ZQ8Ptdlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0pG1wD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0q5QVu1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhPXj430455
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvFd73ztF1fu1Rm+GMEjLFt0KdftVYS/vwYiR9FM/dw=; b=j0pG1wD+m2K1K0m0
	7nG9hYcZJyCznKklM6qJL1+5SUqyBdkzjaEM6LKhuDKAtKBIFzz+FVyXGMGK4K+e
	9gG96BrUzHVaWO5lQSgaOf21xlEDY+NR+ja19NMMuSVMNkznHv63J1rWwHk6eBD1
	z1gwOwi2/GXXtOP1OHeyWyCYIIgGogsPi/vogtl/bsJWWh7hGgyN001UDRQN02ph
	M0/5JPdM54+VqmOqnwbLnthxFKJ/xZTmzw8QlmulPxQSAt767rBVADUhC85Q8wwj
	iOhYfeUCfaG1N7DR4DdyLKoZypfj/qKbKjU7JUQqIjErdBizHbweNT61xhsirFja
	hfD6aw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyda2u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:40:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so3320696a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781545209; x=1782150009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvFd73ztF1fu1Rm+GMEjLFt0KdftVYS/vwYiR9FM/dw=;
        b=T0q5QVu19S9ukJmjwZaViVMuqDrdIiXuf0HbxnaBljbpXkuEnPcGUNidM9v2Mo2WGz
         gB5UmE71AdpzJzHwPFnPLV8qYAIHtMz41h/zh6Lb7mDtrBr4EcMNNLDk26DMXje8UfIc
         SyQjpuyGiQ+nAnT5apoRhJENurWgJsHRsSO6ZK39EP59yiF2vnGjiiVWP/ceyNERfvUS
         cxySpmJFBOTNef1IoQZxmO2SXQoTWPr+32UITBQph8nC3bLyA8VTWbRhm/nmyLIh4smq
         LaQun6zitF2ie90NnIEhNZ9bdbTym80iIm8d4GKmMLgUy2nnJqiUjqKrse9C/P0B0f2i
         fMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545209; x=1782150009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvFd73ztF1fu1Rm+GMEjLFt0KdftVYS/vwYiR9FM/dw=;
        b=Mm0XRrcl5ndqRqr3TSEUT+SX1LluEgwP3uGF3e6xf3uqYzaEX4LALLa6WTp0l2UygX
         9ShTS8jQEIUBCg2cR3fMryW/Um60Ig+ER8fOsxUmkWiKkT9q6/ywuk69SyzYKOrt3gFo
         Ov9xlZ+cWf5CsQjNceO4CD/3X/C9kR/wEpnzCSn/+zyJ6gWLZj6+gfUcqivnsOJFFpt2
         Evq5TTrni/gS3wuXI6Yzknww2BEokwPWzH69dOeS6QrPsULE0D+gIiAryripSXQbs62a
         3GwtzxUPLyY+/X0nu3IZ2cFED8XXvMS5WF24kBy/BrLQm/brsDpuryw7yJatzi74veX/
         LVSg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZkQ9twNJ8OjLc4dNwwO52litlqvV0T4PAOF9vOx2xCubHLkWFIKrsw1oRlbait6e/3L8wEuTlHiG2YYsB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1dF/C76+OiP+1wIxnoEz1WyX22Yv3naotz6qQ0SyjCjCYDOYf
	F5ZD7pMxU4TiuEHLC7y8DG1eLI1eOE589XwHYI62VR7PYFLv2IYkAtzyRK9jPsE+3NRNFF9PVOD
	mIVuN/qstwQMHpPKEX5iXnDFecgpMPqPPkeYWGBx87AaV5hixzIXBC/RD5f47rq6VDRuxoiCwBg
	Lm
X-Gm-Gg: Acq92OGaTCeKtCDIXJeNaGHzvkkvnySs3JZDsQ750WsZszrOHii3pcZ/GBAkRV1bHv7
	aOdIkPRxBJ48nt785PM5Jz7k095fmXpYKyp7qOj0wTVPGdLtnYPBYR/r3M4bXFM4Rb4a48JZIGR
	9iRoKivGPtsB4UydUQGbDEgSRMoK8EfCsIuCJtnFY3obKYyTkVBRedOn6iOcCoJAIGzEJILIWTG
	JbAk9PliSbDQj/Q/0XW+dzstUzv2DgLgbKgwj5G2gwq2Ne7GPVvS7i1kVoSkveodTQD5t3LDGDs
	6+lHw79BYTIK82ugMiMARcEdBu1ViQrjT4PBlue/xA6osq4y7ky7f3dGDIzQYaoIwKsfGjWdjwB
	WVcXiAJKN9W7XkQkXXQRgS4KhtHO4tRf1/vXXBjH40NQUPnZmVMcvTe1zR095yPtvZA==
X-Received: by 2002:a17:90b:51c4:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-37c2bd5c7f3mr11720617a91.24.1781545208984;
        Mon, 15 Jun 2026 10:40:08 -0700 (PDT)
X-Received: by 2002:a17:90b:51c4:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-37c2bd5c7f3mr11720591a91.24.1781545208484;
        Mon, 15 Jun 2026 10:40:08 -0700 (PDT)
Received: from [192.168.1.48] ([122.164.85.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e7b2c312sm6933191a91.1.2026.06.15.10.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 10:40:07 -0700 (PDT)
Message-ID: <a1501ac2-277c-4993-88fa-f29f0123c8a4@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 23:10:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
 <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
 <737655dd-2059-421d-a9ca-91ebd1b1209b@sirena.org.uk>
 <c649bd80-4bb0-4a92-bacc-949ca40a1fe9@oss.qualcomm.com>
 <f2e9f59c-3de7-41e4-92d9-88f91955175d@sirena.org.uk>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <f2e9f59c-3de7-41e4-92d9-88f91955175d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SyTDT95IVHVbPj2lEHDezwKI4qvN_OYy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4NyBTYWx0ZWRfX2U57zFcyVi6p
 BoVhoMwcOPXUajhrLbg5cEZN+Klk/2ogy/RWpDikyIvZ0a//V84VsE0MJO2X21ihTGemky5F3SF
 1/wOoq8E4yNcNnwfsNCuHXLGvWeARWM=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a3038f9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=BchUXt3FRQcObq55vMoYrw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3IG1bLz3NaerdrZfOx0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: SyTDT95IVHVbPj2lEHDezwKI4qvN_OYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4NyBTYWx0ZWRfX6MQdxVK7Qmnq
 KtjxgCdnLzeesgmJ54eeRPyvTbwLB/o/th8PdB4g2B5BZ8fBIECIJJ1jAJEL2BZDsAhdvWiOaey
 yb3wZqisHnagvluZ7Q9Rbx6KaGm360rj04wz4sr3nRrt+elXbBqg2RE0WtQJHVjWosNSVaTmPqd
 r8VkWKBSb/KlY8AQzdXUtL1joLcTgOws3wNplF8RYLBvH1jEbKjCtPF073XzOT3rPswV/4nRSy8
 NDUgA8ZOWaArPV2Z7sqq2JkGkqI9sbiMZmawefpDGWN+2bG1citBj1ngqN2gdAsJdrNXaPmfRLt
 XWnMgcKcrRQksD8BvCgT30/NP3VCyEUMtQeplw1htZu01v5ZFYEk6FO96MPOH907x87PSesg5FS
 jvxX0n9ol+J6jxERlNqqVjKcn0aIzRTbEN7Qj8plTecgqKGe0hIiF3nB8c7pROhi5AvOedpIp4f
 hm/pXpnSmmCvktJGaOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-113251-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16C0F688ECC


On 6/15/2026 11:01 PM, Mark Brown wrote:
> On Mon, Jun 15, 2026 at 10:54:26PM +0530, Kathiravan Thirumoorthy wrote:
>> On 6/15/2026 9:28 PM, Mark Brown wrote:
>>> This looks like a get_status() operation, not an enable operation?  The
>>> enables and disables are pure clock operations.
>> Thanks, Mark for the review. If I understand correctly, I should track the
>> clock enable/disable operations and return that state in the is_enabled()
>> callback (as I did in v1). Please let me know if my understanding does not
>> align with your expectations.
> Yes.  If as it seems the device can actually implement a get_status()
> operation the driver should do that as well.

Thanks Mark. I shall introduce get_status() with STATUS register read 
back and update the is_enabled() to track the clock enable / disable 
operation.


