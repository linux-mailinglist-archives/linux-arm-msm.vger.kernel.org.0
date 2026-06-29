Return-Path: <linux-arm-msm+bounces-114966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L9GAMPFDQmpt3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:07:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DEC6D8AD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:07:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MqZ7xCHb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h2u3lGXR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114966-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114966-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 379503026788
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60703D79EF;
	Mon, 29 Jun 2026 10:06:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457AA3FC5BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727586; cv=none; b=CNdfKS8FKak/Zrn+sh1oj/3Zu9ldRdHIqxjD6sk7jH0rOpJuz0uYku9MjqmaddUtOI5gyXZX7TYvx6rFuxnubUigAak51BJjC9Mlb3UBjWxzsiVhXYesJ4WQlR9tQ6KLFH3pve+JbuBnR0WS10Bpn8NsPFhelpdeIyMbTGeU5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727586; c=relaxed/simple;
	bh=eYrZuUDW54GVV8/zA+Zs7S0GCSgEOyJGq3UYJVTrPJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7ZsdQQXo7U1M+TMwAfNNeC+NuhlaFOSLyGndMVVBB1BCxZ9nedBuy/i9r5fKJSTEt8zq+lfL3EyFJkz8DBA7MIuV6xQrs/9iLjAy2zS+/mIapgtrYVd8rlBFTYdWN9Xh+JAnjQPcjNgLKAHyBEkz5/Y7/PsM6dVOb206Bc0IA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqZ7xCHb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2u3lGXR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wYLB2391272
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVt6Gi25NiYqcnkyDANHxTfSbL/4fUYAeYFJ+RUI7cE=; b=MqZ7xCHbU1O4tss5
	EMuW985nkiThlT3+GsjK3ceVrdJuznujEYmCOJYJlPcy2hDjSRSBLI0qofA8W3Df
	UHspn07PPrzMDWwOvJI5Qpn1m2PHQGN2TmD0kf9mA8JL2RyXxR44ndHznQPt+BMO
	VlMR23Efa7mhmgwVR/T3CJjflWI+LPBYyNyAcjgnFUcu6ZGX4sW+aVt31Cv1Aa+f
	7H2ZCGXJLwF8gCLP7f58JXPPd6UBVusZLffrQ5RxDjwIPfUZNmWa5Jjjkisz1SBv
	gEpeffsGZjxTM+UeDMDISujGXSAcdiWYJIHnne8FN3A9xH98a1KixsWEy7LKC1Jt
	ChXDMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw89mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bea07880dso3929831cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727583; x=1783332383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVt6Gi25NiYqcnkyDANHxTfSbL/4fUYAeYFJ+RUI7cE=;
        b=h2u3lGXRGjNIEBh/Ci+2zLvpnbusJTRKsC4HUkcss2VdtPnKzENwcsNAdepL8TnXI5
         o+4sBXmiYKiq3OLTLiC73hucrvnpdv8OrVToLmvdbnrD6Qh4DRe+kqFd7+q6p2p2mRAb
         t6/Zph5aCC7+m6QcIjBsuBN0eNa/k6PDVxdKzM2oW7xAOoEEMB2GAyOI4b0N8Ik1KHuF
         Fk6hZ0IIwe7K7Z4ITZShsxW1hNAXPmUN/zXBrgIaBuJ8lpeNnhQ9AVoG9+CYqMmIpKIU
         +oH+okEyMn0McjUxmUYRF29jMFyV5vctYcJ6kQrOBm2euly2+YfLXiKxpjAX4GKAm+Jt
         VImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727583; x=1783332383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVt6Gi25NiYqcnkyDANHxTfSbL/4fUYAeYFJ+RUI7cE=;
        b=cJnTvnQbjYUg+wY0tNLHmEit6+fhwAuct2PzJky60U3uWY9XyXg2hxFq2KJL0p3ToT
         xjchhcfr2L0y5tb8d3S9j2pkPI4WSdID+HHebgmwze+j+KZCj7gRiU6cqkiVvv1VUVLr
         fBhQbnv2xt4YXWCHPZtKeYDJBx/ALgpvqBNrq5ivZy81zm5OboBXHVaeoAsc9BDc7qib
         7ntOrK1vdXWoTxqp3eBLJ2syIEBe+MiW22sa+pucBmQZJliaYBX0T0kkqDpXy2yxFkpf
         GVFACjypVMYQeX2X4cz59zBOQnNnauhU6A4CoHeHQwYhKGQmRgitBXJgWWFkAnlBW5Lx
         TjWg==
X-Forwarded-Encrypted: i=1; AFNElJ9tDYKzPctu36zUVqxkttYXW6asXRFdC5ZqYZbtS+HEIhxt5hlXMlCN14iwPyiKid3KXhYn+H+XWXssJg4N@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOZRCgQe5qC5BRXHvjg4NGmWhiTt+Kbp8Nmulu4aLmMEEK5r6
	6ZYCmV9S81U7cskAHf0Ozaoe4fHEVG2qUXaHOwxa9kVgAiXRzENd+fI+wifFsJ39VxwkmzlYYBy
	p+8HpNuzMMylB+xoK5mQqiH6lAJkHnISkYB/xFMtjsWFYcCErZs7k+UblFBOTFMLtAX/L
X-Gm-Gg: AfdE7clX5tN7Hn/6+HgRLIGQpcOD/oYPTJj5oA8dArcV+LGrC2vwp/sc78A+b0SyHxi
	KEQ0ASgHnzUlOb18niw1uwVgFISzJznCWLXGWZKJlbe+m9jgGjLsP5nhWqojbwAk7vTsPMqBrjs
	qx1PI/m6D9yXnXqOFicGXzKyD+S65GxqbZjVQi/QnC/vVOjGa9eEiPKOuldIU6TjJwaWQCdXTcE
	v4v41y1nx0PhVAKbovitKx8HR+tb0pwvxceJ3EOLjyyl7u0pfR/X8434bweq8i4kuebO/kVRGwV
	HqxbJTryBFeyby8c+AYD5ZgaAVqe0YqLKOXOy5QBbIcojWRxmNE/ll7kRKBsingwKVD6WvTXXZN
	gc3mtJ3qj88ErPuA/81f2N1bxdm880BWGZYI=
X-Received: by 2002:a05:622a:3d0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51beab3578cmr59351981cf.4.1782727583420;
        Mon, 29 Jun 2026 03:06:23 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51beab3578cmr59351661cf.4.1782727582842;
        Mon, 29 Jun 2026 03:06:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe8125sm747959766b.19.2026.06.29.03.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:06:21 -0700 (PDT)
Message-ID: <bfacf381-8112-4c12-b87c-46cab7d7f284@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:06:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Xuyang Dong <dongxuyang@eswincomputing.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX/muxllAhu3Fv
 40W7LfVqBdQsV4nxbnjXHwCHqMMWOLy0wHE/vdXwjKna8aG4zHv2dSLdgMH8XQ39TxhpcwOXRqk
 4ffvn0KmFEHdGPpyA9d206LIFhL8MEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX9wTKNaw8+gzG
 LZOiDoF8Jv3yubSmNZsp6sQ2YjRyTeDhIrkO9kqmLLLkVY595lsRVetHwBqoL+2DnVcGgb0kECM
 iintR4N+Cm9+52xjLBYFM59GDEqZgLI6KAkfukSuPggMM7I6bKNjtNa8bO7qoIxLwXO29VYvRqE
 XVbAqUMarxcWAXrkucYTfylo/wXcqM+ji/NSlF32NHvLc49wy+Ch2gLtcXQunfHh1hnHojcTdja
 Jj1HDUj6c0yeccOJfcsauNT2mT+zXoOPbk5uES+1u2KiIKiy+vLlKwSLMQ8pov9N5Rhi8F5Qm0+
 GMSWa/rR5mLbzTMn4KBft9iEwuNd3kjlWQtkchglhyNrZIu40ywOLW3XyfZovF7ZsKQhFdDnc83
 cF29NLsbQvGRQ2M9UbbvbDq5WL7u1z8oKaTiTTSGlOADNDWIwfMKaJsbjhEoLEvbRAdjMzKnK+q
 3RmXNVRWD4hqLxpEdnw==
X-Proofpoint-GUID: hPJNyc7BEf5Jpo_CTt-ZWmtYGouYgJAB
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a4243a0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NDI1EqwwtgGkLGOeOxsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hPJNyc7BEf5Jpo_CTt-ZWmtYGouYgJAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114966-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66DEC6D8AD3

On 6/26/26 6:32 PM, Brian Masney wrote:
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
> 
> This series fixes this by adding support for sync_state to the clk
> subsystem.
> 
> Changes in v3:

The version tag is missing from the subjects of the patches you sent
By the trailers, it seems like you used b4.. did you play with
prep --force-revision by chance?

Konrad

