Return-Path: <linux-arm-msm+bounces-115071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6erBDe9vQmqz7AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:15:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 774306DAEE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:15:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q+MEznC2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="j/jH8gyB";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115071-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115071-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 831FB30B343D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F8E401494;
	Mon, 29 Jun 2026 12:47:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5CA403AE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:47:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737260; cv=none; b=dhlsygEQmsxVDe6LpDPwsgyFJ2jygtDIYih1SPUVyGziEgmZMLosCf9yL6LE0TaNJddCBCdLjNPnWpxm2fApGei1TeJqMkbv+gxXnam2O3a0auH5CBq+7wNwVw9iSqePazyLWLmg7WhFdQFu83J+om9ACXz5C0ntTcHKQ+v4I8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737260; c=relaxed/simple;
	bh=uOU7ruRgctPgg/Wix4v7+9GmqLcV0osZIBR40g8/VFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hT0AnHklK4DjNx6MiTZkix4wghSmsLsj2gygBijlFSzFbtcJkpqHoISWJd5mFw92NMoP1Ot/xl/j5MsHHgTbHWriuB9to7ElHOUdy/dbVOKxG/k2rD8AJ6MbV9CaAmCWeNx3JNnZMzGTqEz1TePxUvrF20QIbYN9jlxfRIfgjFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+MEznC2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/jH8gyB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT45H2646947
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQL0usVdCCvSUM4dAKsCdGlSjRRi4QeM00uIctedMDM=; b=Q+MEznC2afK/uQ1D
	Zaoeg6E/nQBpLdYqzu7G9xFCG5/jZ0f0L3UJ7q5jM57nvZZ7K7pANwo1pwwFc717
	c+EzFOXzo2cKG+xk5idbgoZ/f4EyKJ7F45NTiar5gvl9hyIWLUxkDNYUKvdMxDQp
	hrTX7FfdtHDRahWbpecCcqnmDKHSu7rEAN/QtFBIpfHhEQbkAUOtHn62O35ptzou
	aQhop/Ph3jFPWVSYYEP327OX+Nk+xgKOVkp5xqGZ4kTvlopWCjXcF7hm1aLRDw4l
	Tjtn92S2yztOGi3LHy4QCZNLd8QMxtFTzFB7ukFEW9eCy2ExTDv7xUVE54Yj+UOU
	ySymmQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsa8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:47:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a07295d67so8854681cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782737257; x=1783342057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQL0usVdCCvSUM4dAKsCdGlSjRRi4QeM00uIctedMDM=;
        b=j/jH8gyB80iFVX1dw3rHL+cckPeeHDF5qDjWSMy4npkE3UGPbKyN/s/iyUN53xN0Bg
         wngVQDHCmz26/bvAVE6IOw7cggfAo10IedqTz1EXv1ZQwyyqzx5KTRKO7ZNhOs7i/03L
         /8oWi/jesPnCdMLR0Ye83beqlLvMAHje4MSWfLIC9s8A98V53Q7FEvompu4Efq3yoGzA
         Hz6qKtkuht7GxV3Cd94qIAPt3IfP9dcAeNuz0/rElH7IiPM4uOI354pyPyx/MUjUP88G
         orNVScOO/FYl5V8/4k+bQveDJhtQtZW51Ym1U9Mbnm2ziaasr3OqgVACqTO6lIWDiD6g
         eM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737257; x=1783342057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQL0usVdCCvSUM4dAKsCdGlSjRRi4QeM00uIctedMDM=;
        b=aTQ+isqua2ch4uPICeza5O5PjxtuzlSbVHM6J2P/v8lY4II/3YiduOLZNzW3bgLz7H
         KeBvSD0lhVCYSHeqTEOpajBJNzz9hwAiGtZDCgO2baYtBrGRjoOtHQH4RGvfPnnk1t2Q
         ONGHCYCEMduIpYUSGhjQ+ZCeujoMnQBJH+mymrr+7W7zl8IUKwH5ucqfOdZiBrRnoD9n
         XBJ5YDY7eARKZyyn48o+DiE2c6R+RL0BPimUESlXh7JD+fxdd9A7DrN332mL5N+syFMh
         SWrLGCNjNIzX7kZtqbdArRmDTLiwxWTaLS2mos3b8siJMjbbfHH9ehmN1GPLsBBDbNhQ
         iwaA==
X-Gm-Message-State: AOJu0YyGA/be/Poj7Mn6rx7pEt3CTph6gpr81LOmAPwe0TbUCTsFx4JT
	+dtvzJJIvJqHxLRBpDHGeapCELeyNr9emtC2B6E0UwThnJvKeooCj6vBothagmePj9Jc0wue9tE
	7qCxE3hu0VPYV/9tYkTKVnxTm4EdtOYSxPnE44vylwuM/hPxJGYRO4DOMokKB9nh2RWmH
X-Gm-Gg: AfdE7cnMXQiFwnEqQ09XD8ZLk34ThzZgktZ3uAyjOnmB+gKGv6xObiCLf2jyBsnjbjy
	hOOU/RKLFlELzkOew3vp79nOAWY5x3kksilRLchdg+RD/ifNzUjorNPPA2GQRBlgCH1AE5mEc5j
	MgxkNo2b+yxcpOCHrE4IZykfUeU97SpFKPOQs7FWXZlGPBNlbGYO281k2GlJWyMce1lhQQY6a+i
	OMGHVgF3xnchc5aN2I1lmzQkKhazVOPoTYkS4Cg3lT3W2K2n8tY7qoPJ1gwTiW5K+17oCP76d6F
	Kl7m+J1sbHRXlK1AgWtREpySHvGTa1sulzSVVfVaLviC4xywX2RNBn6KkXy8A9NOz41TWrvlGDe
	rHPbVXi6c9DO7pOBlrD5Ot4BCgwstHNoRWLY=
X-Received: by 2002:a05:622a:1aa0:b0:51a:d45e:638d with SMTP id d75a77b69052e-51ad45e6f69mr78096681cf.8.1782737257590;
        Mon, 29 Jun 2026 05:47:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:51a:d45e:638d with SMTP id d75a77b69052e-51ad45e6f69mr78096241cf.8.1782737256970;
        Mon, 29 Jun 2026 05:47:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afcb314sm71531191fa.15.2026.06.29.05.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:47:35 -0700 (PDT)
Message-ID: <43293037-99bd-457a-b190-31fb24625b1c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: Split protocol start out of native_probe
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com
References: <20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfX+/XHqXpX90SR
 bBBWwBh7sB493owLgDiXQrLUt9k7rKNJXax+wadIP3YAeilw2rq/jbRjzOgL7Srn0gDVhYJRhTb
 kjGZk1nF7ben5p28auzdPCpLtlYLbVRob8eLWLWGgkt1Ve6Uuq/L0owhqfajc+38jzqskHkkKiR
 nWFnOJq2INkwjpAUqIbwItTfSfPo8mFt6oCUaf4CRo1z83vd52k0TjG8mtBwxTPFp+or8I7fWlI
 cLFzYHnGOocIqyAGf4Swr2gtWbN2xg9GkA08V3Qlwk5SuK9ghQBDCkfNidki8wUL5Asoep7kUUd
 cbeN1SH6zvgDaBYGml1IPvKSZT2gQyqLB6VYmLonjQ9ugl+d/NJdqiz7WfnMcs+EfOHEEroShia
 eSrX7dVSTK5QTbJBf+m3yGbpuDvAO/cNihkHYK4XkAmP5nKQiGGhTyQykiaodrxk1Zf7AUgGwC+
 S3mTaZYRdYkS+JUT31g==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42696a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AXr40cIQNxmEwLS31UYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfXxwljVs4EankV
 sDqZjsi5cossPhiPN0shn/y128phD38+jRG0mRx8jOUNMKa96DMv8Cy7HQjjRqj1NQ3tARG+hpw
 L7vuE2xX/aaxxVTeQIAcfCQXiJ10tRc=
X-Proofpoint-ORIG-GUID: 7zvVe1v3KygV4nB2jEUs2KsVOCPgi8NS
X-Proofpoint-GUID: 7zvVe1v3KygV4nB2jEUs2KsVOCPgi8NS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115071-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:chunkai.deng@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chris.lew@oss.qualcomm.com,m:tony.truong@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 774306DAEE9

On 6/19/26 7:01 AM, Chunkai Deng wrote:
> The SMEM and RPM transports request their receive interrupt with
> IRQF_NO_AUTOEN and enable it only after qcom_glink_native_probe()
> returns. Since native_probe() sends the initial version command, the
> remote may ACK before the local IRQ is enabled, stalling the version
> handshake on a fast remote.
> 
> Split the protocol start (qcom_glink_send_version() and
> qcom_glink_create_chrdev()) into a new qcom_glink_native_start().
> Transports now enable their IRQ first, then call native_start(), so the
> version ACK is guaranteed to be serviced.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---

Would it not be simpler to just move the devm_request_irq a bit down
and remove the NO_AUTOEN flag then?

Konrad

