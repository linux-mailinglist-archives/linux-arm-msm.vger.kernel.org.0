Return-Path: <linux-arm-msm+bounces-115467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SV5EEpTUQ2oXjwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:37:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A826E57E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:37:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X3mayltk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="JlTAL/aY";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115467-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115467-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 032ED3064FBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2011743CEE1;
	Tue, 30 Jun 2026 14:34:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D0543C06F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:34:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830094; cv=none; b=UsP7bxMMPoi3MgnJNigP/CQclbN4UunM1laHZzRzPgEy60BgJJP+jczsge3V80rkOwHG4uajCWBKr5C8/ltr35KMaNdN1UnDjjI3qXjXQ4G66V7fXB7wAQ9wjgoMZfO9hYtW12Pqfxv5qPhPEUlvRc+Rz3p+2+yQjh3l2kH5lQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830094; c=relaxed/simple;
	bh=lZM7oAAbV048Ywo8OjwAxBmcHqaUbKplwz6HjKvzIeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1zbaqoE0AsBu9SuSJGNdh1bOZgBJRY1QnHZ/Z1lbUL22d+SWCOKvAsOd3JpSL+mv4GpBAG2Fl8vkXOYdTOt9PHKqUfEoc/1rj7xGrhNHJaz02rvLVotWG6gmXJcEKdI5nf634A0vWKLw4YbcxE+vclAQSHfBsL/kSk7MKVLHeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3mayltk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlTAL/aY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDHsl2186058
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJNR3PJ74j3mrm+neVf4Bn1hKurLmhNGMo9o97L4Rgg=; b=X3mayltkFx8D+Dwx
	z7uT4zpKb+4gb1wM0sjCLE74OQrhiJt9A9nylkWrelzhD5VcoX5zRHusrTScIoWN
	pwmXErkpSbHApPytSYTGr8DakJsUbX7E80uo9bE1T2Up1YLdcjwGYQgKwlnRTSza
	95lOcP3GFmm0etpGuUknINbFjFsiozHS9VmnqhLt0OEcjz4+BitPLpmx2S+9Uciw
	TAF0NtjwTWN7TStOOShlKJe6uop/njWMRAG4IMZ2G/AHzAu2dsQy8t1Ega4Mbt1o
	vZhdc7jwGyCLfDNBRrgTvTP+sij2l1u7YRjGP7+aRdmcXfeb/mFYUKHXcTUteHKD
	JBrfFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46862qnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:34:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e63df032bso124927585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782830091; x=1783434891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJNR3PJ74j3mrm+neVf4Bn1hKurLmhNGMo9o97L4Rgg=;
        b=JlTAL/aYfslil68nUrUY6rFlKnarAT+RNVrRKQTwMS9JRk2JKGkLB9IG/P3EupAP9M
         veHsCLDwKgTHMFAJfoXm+yXemTe77qmujtMyllIAkU5D9dAQVfMjkpEEdy5CJ7/6uKxq
         C0Hd9+uo7eBj7hZOBiRm5/vwtZymYIm1tFc9JcdwAIRNTRFZAt/uHXwrOPxK0R7N3Frr
         JQGK19gV9bFQ7jrouF0CMctdrCvF/qzqSBcuwQCaaI+HK++m6uRuEtMkwTF0HdZglt47
         Z3vk4bDAuezbKc5dr9Oq+uBQH1B5X6ssLCaSKgDnNSl0GrA73YkQxlms/HwjS9VJ2C+x
         XCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830091; x=1783434891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJNR3PJ74j3mrm+neVf4Bn1hKurLmhNGMo9o97L4Rgg=;
        b=EO52o1HuOZ6ApEwYJKpxD0F3xlBQnSJsPLexGGAfCjliB3Ci6COxocTrQe+MOcq7H1
         jxzhw2mkhrgxT2DJYzfdHflS+zihReOM8FSuAgLTFgABtt8pRhuFzaON5f01r+2y3YUg
         Uu2fUMc3xZXblb7fQKhWcFWnXZGen8OErk0R7z7wBn+Ylhyxmyj7nAZiQCR7Bb0Gjuld
         6lDhfwwIWjhKUHgNI0ZMU/eeDIqLwl0hYdYAGiC+jFzAW3ozZ4+KZ1ay4mNYSDoq2HS8
         I6YQPsYsdi+utTs+XQRw3JVLv6mUlZQAd6XKVarTew4HhiB27SRFJKQRYI8PpYKWEVqa
         H6fg==
X-Forwarded-Encrypted: i=1; AFNElJ8XVSftXFjntn+EcwnRMFVHHg7NcQ3zYKA4QDp0Uwh2K0tvHdulmgX80mctRoP4Uxf3AaDzECbWG7EGiXYF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xxDs2qxvo5I+pgPMqfh6MNu4x2XMHO3AAMecV84Lfz5abLiF
	Fj0g5zrQDNoeyeRoHJgm/MjCCNqK9L/2RU6IGCLVI6o5yJT/5SwhqviUIZx0RdEP12VVFdxfEp5
	fwTdqfF4EJ/mAB2n94mnZGHvjA8B6lHTEgu9seb7+P4iYvGIA2GF4CWBDAA5DLpLM4+V4
X-Gm-Gg: AfdE7ckxbYO+16PzN+fBp2V4KbSbHVeRbZ4fmJiXl68sB4V6opeXbIKgnQLJUty8LLv
	JrRddcNW9Ka+aG034sn3gZMbC0bOQhle2Ne4eGZaAknzqoYCdD0O9gfWaXzFQaA4fRekYldh09t
	p8bWFjGjbGZhSyonxvWL2Vei/27ST6NV4S+l86Z0C7iu2bkmDbuPD0wKxCa7dHPahm1dta+C7Q0
	PbSv/I0jzXdWwKXWpFqBuo7Jg6XnT/x2FeohM25FNkK5t/hdqaB8MgeiVYGa4IYXq3zRm2490e/
	VSAuPVfRMAkGjbfwqGECOUAuSA/xmcftQyVmAK3vfP538bjc3HbJgGgC2FqtAq+zA15fqhU56yN
	dWlcVZPdFMFXwabcXThbUaM7JpcWb53+PN16W4ME=
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr260375185a.15.1782830091190;
        Tue, 30 Jun 2026 07:34:51 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr260369185a.15.1782830090635;
        Tue, 30 Jun 2026 07:34:50 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cde2sm8499097f8f.20.2026.06.30.07.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:34:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
Date: Tue, 30 Jun 2026 16:34:47 +0200
Message-ID: <178283008339.36195.17218594271210377008.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iG_r2yjHFKMJznc_d0FhDEObvgQI6UnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfX3sO9oHFN64wv
 8HNX8SuFeUB+7NddbFtZypq0ibwuIhb4Icii1bLgQS/fPM0wdIjkvAKFXU846iVR8DHtipx19JY
 57G2kbW83ES977soSziH+TxnB+gc9zwKRwv8aTZVcmS6QgrmEhsfSza04eS852oF137PRK1sFcs
 qHLKDyugBMqqovk8eUP4nZpb66Fp+Vm95dsLB/e3YE39//LDP/+QGXexX0hFKye99BJOMLszVjw
 pbrVH6kbBgS22ZTpi95bWY858eRh225FOGSaKq0sMFvSPMMUDZ1okT21p/1l8nhV5o+/DzgO7LX
 RCOM8vvgySrJBTZBN6lSE9jlDavPq0ONMPRBf0wbWV+wcEJHje9e42YN9DnZDRBqfB6bskTXoZO
 zA8H8sIaZOvUxdAZ1Pe2IZ4K/oh9i+YSDwuvmBITfXJhYn41/GupwIgiiWmiEsr3J2SmYpiAmEP
 y1YG1QcCYyBV10gMh8w==
X-Proofpoint-GUID: iG_r2yjHFKMJznc_d0FhDEObvgQI6UnP
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43d40b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CudRCQxTT4vl8MJ7sxAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfX4vNsBF51HMgc
 m3P6SPC0dEnYVefABErfjZOKV7iM45hiybRdSZc0f1bZ9zDD6J0Twg02W5HgA+QO4/LcbMxD0jG
 hP1D0xVGu4W+h7yKU/RRJVkiPGyx000=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115467-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:johannes.goede@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97A826E57E7


On Tue, 23 Jun 2026 14:27:31 +0200, Hans de Goede wrote:
> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
> this is unnecessary because gpiochip_allocate_mask() already does this.
> 
> 

Applied, thanks!

[1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
      https://git.kernel.org/brgl/c/72323d7dc5118f5c7c269ff67797d342ed9effc7
[2/2] pinctrl: qcom: Drop unused irq_data argument from msm_gpio_update_dual_edge_pos()
      https://git.kernel.org/brgl/c/e417d51c7f2ee08361b57a97869a2870bb417782

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

