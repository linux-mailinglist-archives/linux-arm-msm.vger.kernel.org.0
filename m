Return-Path: <linux-arm-msm+bounces-114491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H0YJIUf4PGrEvAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:43:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810C6C456D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:43:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Oaz9uoSc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JV5+hM9I;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114491-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114491-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01FE2303D728
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0CC2EF67A;
	Thu, 25 Jun 2026 09:38:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960091862A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:38:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380330; cv=none; b=WWqdLTbFLQCPnMJjs7TVveO/4DMFYsvu2tiLhqx34UK671YqOZf3Ggt3EUTP0R6KV7QaeL7oJ+6xPgzMdaVTb3QEwDtxg+C9GP2fR/ChPjwrElOiWRdo3fPqPAr8qBBhMANG6afqKTJb+Gg869Vlsz5cY1UEPU1Ys+LfvCglruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380330; c=relaxed/simple;
	bh=+A6m/aIwYk42JS70hoiJqpbi65xRhPR7Kn3tUXs43ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCRzFAD9cvEnTF3COh1tldAI2JT6a/iEJLpnMmhlzDpoVAGFYTPYhIX/3kd9Cnak8KZO+UpFk3mvaLwJo9XjLKuTcMJUQg1Swf9yIQKyvJQdVSz9mJfU3eGBjE1UjqJbV/aieEwG/ToLLQpU+yHyT5hhVZ8gaKHtBCEMXL1vQDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oaz9uoSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JV5+hM9I; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p6Bj1821288
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2wFIQ+4gIsXTKmSVdPfQPxLOLQaHn+79LEqas5so+s=; b=Oaz9uoScJPsDt5Pg
	WE8MlfbpnopfD94uTh4o131FqXp2pXKGlhmzkZR7kWg4ALZAs2qDnBI/vhATMgjj
	yfDae6QW7l1z/pSUCC5qEDI9LEwnR8/F6t7R4UCbNpN8uWvTpnG8qzv4ixTDoirx
	FNseoBzamnKP2IXCTVsyM9Egbh3UdMuFNgyesNBADkExB1SseYs8WefMMzLakjLY
	uoGg0u1eiEtfNYno6wT8J7oQAGkVQcJCRiLNnwlsyvIeDuueRpml3N0ewQRit3lg
	F0evdPVxtkGm39TkBYQjh4HRhRC2tJ4BgBTrqGbHwN/trZxmlVvvGJpQXgSuS0SC
	iR7k+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8rp4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:38:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915737aaf0bso15676085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782380327; x=1782985127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2wFIQ+4gIsXTKmSVdPfQPxLOLQaHn+79LEqas5so+s=;
        b=JV5+hM9IDh3fkBJkoqUrPbsHFPb7SqLKvx1Iywu3V/7AfW82i0ieuBn+8g0EXClJDv
         6SmDc0re8fyy3yIWS6yQext5dDOdaYq88ja9TRx9jTukSvkFYFpAUeVK0C79gLIsoElR
         SwRHt23Iav5rGqBFVPD3qNNgpARb99F4T4WB7zW5+BDpkjg9pkyhETMWsbt79c28jUXK
         rOz6BUj4+WruuNu5VzRZsHDHmI50Yg2GiktmP1tEiZy0mDAe1MCTV+O5VvRED/zftdEy
         JxJ2rf1+oNKD370+yiRYr9MGlQRehsdSY1zDEy7SOU711wltyVanyPu09Exb0ldBWyTP
         iFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380327; x=1782985127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2wFIQ+4gIsXTKmSVdPfQPxLOLQaHn+79LEqas5so+s=;
        b=qEu/po/HLSuSjK0i6fPsbVCa8roVgzzjx5x51Pmlajc1WEmLWE5JrHFebVKL3F/OYV
         1f9OuARuYm6F6M3u3V1m2bLP1RJuPhmSmYVDj0VUtbVqeFJ4neGa0nTvVdsHtOPVE/5w
         3eFgHUWeMyTL7pwSqX38xVi2bZ+hDtopDKwzAFwNrMVk4EaHwGJP7hzpg8KUHRuz5e5w
         GQBUkhBks2Ee0ezdFQQZwiroL0do2xPwsyq1qAy7Ekiu9iOsaoZZHfZLijwo1o5Gvi1S
         FJKkukeCrlWyPAgXPzvw/ABIqCbPoUvwmrjsSn3CnrALu/Tb1Gd/j7sDbIL8K+rZwYgX
         xWdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JRpb7r3Z2MKvAenhz1Vu1C+kJS8BvFk43B5U/Xx3cta1Lg8tBKJdq88o32VRc4+E/K7Y92a1gE3fiqS5Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyPrqCeOdFAzP/UT9l4XsU4WKDnV/Aks9xdVowazRlqmTXinEoH
	+xktdk2diX9tEz0RTB7SBCVI8PLvFOVNJSDjxOLz8n/1xOPhzXJqLpB2iHMHkRpP/4hIzmeN50F
	UY5lWUY1ZGmFMnS64zU6gmC+qLnhIUe4HU99Fnubanm9cH718jpLWx5sHHi5KaxMZP0kh
X-Gm-Gg: AfdE7clftrDS6bdzaiCaDQZNnR/wqF2n0E9fI6rFY9jF6qY8ur6OJEiqpJ8w/AQKbIc
	9MyAZNOnqHqAd2LsJkxp0TijiRZosBhfqT9iv5/FdPoy0cRaOEgSTWIzS3FXQfCaMSdxDBq/f/L
	rQg5WpUy+Sa3URFdYi2bfOKf9vYTLkTUpbkGBNsW1nV8ruIGCblZy2o0Y2Vj1qd8znctdsL0I4R
	0vzOGchjRtBMwv7mc6sKQZHaQ7RCCfQZ5fzWWmK7oyTIzJ3QUtNtKkrTp5Zm31WhdJjVHPGAioq
	jB0QMVqtJVVhU09rimoec83/s3E/xK3MCKaNLB1N6Pz9czZbYETOxaYW/UC37VUc2g8s/kPAAat
	wikznUW8wAwBW4Bfaj61e3jLLvDSM4bsmIKU=
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr138452585a.5.1782380327232;
        Thu, 25 Jun 2026 02:38:47 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr138448985a.5.1782380326732;
        Thu, 25 Jun 2026 02:38:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05ed6sm139435966b.30.2026.06.25.02.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:38:46 -0700 (PDT)
Message-ID: <ac8712a5-f885-4688-80b8-d4c601a75192@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:38:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: cbf-8996: add clk_sync_state() call
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-4-15f82c64d95c@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-clk-sync-state-v2-4-15f82c64d95c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MiBTYWx0ZWRfX/ru+HzWnPHGR
 fPwRHaW0qrU7kAVaqme1Gfbxcg8MPBJ18Yp4uB8xFTtud2x2t9JAlmGEBqwet0tcWsDIuoo/Sjx
 dtuhKK77QL1ugI+73+/nn6n+WWHv2xY=
X-Proofpoint-GUID: MsLzg7Nj-t5ugx1tNVZxgc8uLMQeUvMc
X-Proofpoint-ORIG-GUID: MsLzg7Nj-t5ugx1tNVZxgc8uLMQeUvMc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MiBTYWx0ZWRfX4IWfQ0738A0D
 Kd3Y30EjWucgg06HqTjE/x1j9uoHyspBDzKkRE77cdlL9eR/ghyq10pIBoC0Nf1gz76Um7JR4u7
 qXCT1dY4uKS3Q+I0RbZrbmgbq1nRQ+rl4q9RP7WGVq7DUt1394nytBuIs5QqHi6F3CCNgl72tbp
 AMHnmsSNespWYnfXXZFxI6WnJytK1X8wovVP1yxFNmMjBo1KzgMQAn6WCbB2zOazuSWwaifE/rb
 rMuB6ymW0c1YrQybrD/3shWHXTe5pW9sHVf/KbYGFmQEq14phhRlf+VqT79bFmXufmo0HBzNn/E
 8uZ6zHYZg7Hnyj1pAtxYE1HBKQI6y24KGyjC7QF56xNyNxSl2JnvXlPVqgRAyLQcHjgS0KJ0IY5
 Mu+a62FDuIK7csWVWrFfUliQICu3q8yeCPHEgIqXSJz63swSC7gnidkeDbQUVzDLAUIf7/XOHWE
 UxCkY/doc7O5NFl6MfA==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3cf727 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=MVrWoMMrqcWW97c4n2cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114491-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2810C6C456D

On 6/16/26 11:09 PM, Brian Masney wrote:
> This driver doesn't use qcom_cc_probe() in qcom/common.c, so it
> shouldn't use the newly introduced qcom_cc_sync_state(). Let's go ahead
> and add a driver-specific sync state call.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

