Return-Path: <linux-arm-msm+bounces-101074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOtOLpfWy2mILwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:13:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B436AC1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5772A314DD6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 14:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5313FA5C0;
	Tue, 31 Mar 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVcXvHU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjrULQS7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C93FA5F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965962; cv=none; b=fHak20H58NYyTXfGod1//ID9odez7EzYUZ8lzT2kt2GBX8Sc51tfdyVJq16/xeN887rn85xOhzZNQV2jk0YeVGfe08hgdDong1kIf74m1hC5Hhbo74blEt1CCETusMhcWYAa7EdPhyjHZy2aX47uEc9sWNwNHUiCsfyMFYKHaPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965962; c=relaxed/simple;
	bh=5ZYD9jbjYNwOeBXsTpKL6AR+Bv7vLMshS9ULJKxEB2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5Bu193/i1WqRf5G3OpZuYnJATmr8NaQHhj50v6C2yyKZU0nLhYdLmSkBlMg+IZ0EOUXOMoRPiyjNXETIWlRoMqgSfn19kZKvlpvjAs4ux4EJ880e4Br9csCbNpVgKFjCpDhmwrMp+tEdO2LNrlyQrMsOPhPjKCe3u7qIx5yir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVcXvHU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjrULQS7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VAfqps1091498
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efGxhIHSRYL+VsFF1dg566KZ0OqtIUQjTJxqz5Hm7Us=; b=PVcXvHU0EmWl+a/k
	jERoUotNLjI9pdwtWF12LCoEoxDAU9J6IvVwJyNFAMeEmGfYKLqIdhQDiDGNtW26
	ZSU1KEMDYYlkMq0wi5RXONy/44PP73KEzlzG2UKXnv7la57VibMXlcAdCyi48JAF
	VFVYP9r4ZFRWmpXPoKviUJ8JE/0ocBlKHKKpw4tV6xJtWi8dF+EpzwsLuDPcOLEk
	NnZvV+CeGpAMIG/n1Mka6FSrW11RWGaL2SVnU0ZmqtL3IHmCa9SkTUbgZXC5WV6p
	GhBXNX0WUKyoDHABHwQbRcE3xKf8yoRIPi6P6cfub1XfDw03lc8oEj9KAi8eepdQ
	iOLFOw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd581x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:05:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56d817b03a8so421981e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774965956; x=1775570756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=efGxhIHSRYL+VsFF1dg566KZ0OqtIUQjTJxqz5Hm7Us=;
        b=SjrULQS7tcq+nC32OoJh+niXl6FkS5EdTjTRVBTnP5gsJTWqoduvZ4hSEj4q5ALBZ+
         hBVmhyw2FHbsEYyQ0ITYymAiySqOMmakLo2KQQV1iTr3sPY9fcita3WAd1KBps2ok7mE
         ezBbHdWQPLj5/e4HdSxh93iR1sHY7hmjORYr46crHKxILEuzH60xbuWm3GCDe1CA9DC4
         ymZJOXzTLXnd1Yep2pz9Rp8+IA9HcXTUqHcmiEuue5efMv8km7ERxlqT/B7x6QdT5pv5
         p0UIxlDedU0uCDgXV6DV5V4/ewmn8HoqxhX11WybGMDFgP9EjP4V6peE17V3fF21ddkz
         qZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965956; x=1775570756;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efGxhIHSRYL+VsFF1dg566KZ0OqtIUQjTJxqz5Hm7Us=;
        b=qDc4xybCqdlzEn9OhPalD0AeaBr9e5ddODJ1ZQJzcj0RUwBZdlKx0GLgVqBsdFQ5pX
         YXde+nXVvQCUd2AspDJmvP0S2Fh733hIFKHbNL2IZ9yXupespzIK8x+42msxizS3vCM/
         SIJuLUQWCCmK1KTyobekuabWIQVU+XHNoBDswvEkjkIsB/rhU7/EXvRCuZXtrtSvD0ay
         4fILsTxrd03wTra2nB20QLf5FOumzJIBgu3SMwCFgDJupwDhLHr5t7UnPtp/MmVVOAf9
         YKrNN2mrz/USXxCyDoWJM+t5KN72+I3ymsdkGmPINt+DM7F0zLtgLaFWjw7V1VlPCK86
         f69Q==
X-Gm-Message-State: AOJu0Ywpsj1lz1+M13wTNDQZItnyULPg+75g5z2KbNqhfYKsvqiMbcBl
	+J4AUiWTXTnO60PBqFqY2Eme6V9cd2FiUgZTnS+QbMjnsBcHSmL5RCOHYK0rqKqF4ZtIlLiCH5t
	3M+mkTO+5Mx8IJX8gnPu/NDv/vaCCbuHTH4cID3CvHJOfT/pmaBFSkWU0QqPPlP5rdpHg
X-Gm-Gg: ATEYQzz6pjgggMy/4fSgA3hnpt3Wpe6L5RDvKIzdZnyJI9Z6vaw+j54TvFipcsNVyan
	WiXSKqtGQGoYmX7Egjw6AZmMdSy9yEitTQeiSzdd0989g1/gwV+jq8WCa8tTaVzJLyjGkHnM6mf
	yufl3slrpugCGWRbakpX1UzMC5bKEx7NdLP0x6FTtL9gYYJUdlrKf/3pq5IF7uM527CUkU7A/gf
	tDKcqX2f6C28hf1C132sL7wWOt72kR6h1D4zHE259Vydns3bCk5t5rxfW3K53yBlf+137j6eeeV
	KUS2CFHzWr13LSFNFe5NyyyymgyLsL5yQLevS9EpgglUm8MTKtLOdZKFEtG24I/xOUGqGUwgILZ
	uk52nzTQxtwflyH4OPuSV1GiO8NE14w+OU0FTjflIAZ/TVBlS
X-Received: by 2002:a05:6122:888b:b0:56d:8493:d455 with SMTP id 71dfb90a1353d-56d8493dc35mr372378e0c.0.1774965956042;
        Tue, 31 Mar 2026 07:05:56 -0700 (PDT)
X-Received: by 2002:a05:6122:888b:b0:56d:8493:d455 with SMTP id 71dfb90a1353d-56d8493dc35mr372344e0c.0.1774965955563;
        Tue, 31 Mar 2026 07:05:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245f87esm26222157f8f.22.2026.03.31.07.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 07:05:54 -0700 (PDT)
Message-ID: <7723c941-0b78-4c85-9029-de2cbecbfa9e@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 16:05:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: eliza: Add display
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9mYcyrl8p-SdV2wECPeQIByLM3eSr96A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzNyBTYWx0ZWRfX7+zeZTi8IFnR
 94ppP4BilEk5NbrJjVlkBe4Vn5zlVEyYFjGwxSAOsDGkQRYEqo2x88QgSVIUPGEY3kkVN7+tQGW
 NYhs9KIUWcSZErCRODBjsp6WZFhU4o06xxK0/unpdYYzdzx2pOzGqS/BcBguwUxZ4Ciip3rIm0f
 411ABAyXMJRIBqXaXkTuKO+QzZ8xnaw9k6DHjh89J6Hliqhp6ulOauuyhBGnSzo2ujBCO+S8jOi
 LjFjZtgZ0HjO7zecDJDsIdH2uoZ0o/sGAb7Wx/NhG9erBPwK8DsizrgLYELfHoNRCXCO+vM7S+x
 ipwgnm7l3wBBxNNP5Mg6hUCGaltw9r1oqYzVOFYgMKiY/x7+QjclkKymDSQKZOK3KIyn6PUj5NO
 7byoWdxza5IKa24joJTxD9jX5xz8mxBObp1cIdAhZxtvAFqzgop1019Wy+Vikzgaw4Nzj0Yqs0H
 Fsav/+t4/dis6NiZGkg==
X-Proofpoint-ORIG-GUID: 9mYcyrl8p-SdV2wECPeQIByLM3eSr96A
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cbd4c5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=waJtRRKn7a1ZN1QpO7MA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310137
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101074-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 671B436AC1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 16:02, Krzysztof Kozlowski wrote:
> Dependency
> ==========
> Depends on USB patches, which are being reviewed, therefore marking it
> as RFC as it cannot be applied.
> https://lore.kernel.org/all/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com/
> 
> Unmerged bindings used here
> ===========================
> dispcc: https://lore.kernel.org/all/20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com/
> (DRM MDSS bindings were applied)

I missed update from Bjorn - the dispcc bindings were merged, so the DTS
depends on that branch with clock headers.

Best regards,
Krzysztof

