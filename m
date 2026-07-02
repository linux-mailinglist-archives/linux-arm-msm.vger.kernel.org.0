Return-Path: <linux-arm-msm+bounces-116023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pOmQExFeRmqFRwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:48:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAF86F7DED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lAHBtZAV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="SJvjH/oV";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116023-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116023-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C3213053316
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0549D480320;
	Thu,  2 Jul 2026 12:39:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A08478E3A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:39:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995986; cv=none; b=SzIc5hAnIpQ3bccJvAJ1oh8CnbKtcwm5iTOvjS2AUh73EhsFbT1JMl3FTUHyrh+Ahw6CY3NoDEfezM48j69oWAUWZjFbKV6aJTq1exgfo9inYCIk1ln+aVYmFFUJDwcd3aFNwuB0RR1W3u7HNS9zx2d7C+X43p5YQSFRzZv7Zt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995986; c=relaxed/simple;
	bh=15ANz7Pnj8+6Kls6yqQlZRBM409sR0JXPv5GM0zvrTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMI3ye8ZThGBzglYixwYE+T4wxbLfzXAp9Bu/Yk4YU1Nlw6MzLMoEheaZo5P+IByPZHePxv7FbHLtRq95M2dszS20gOutKkS8i0rxOdN4jS9SfguhFfpcSWi7wqzx7sFszJ9eLyJVWRPcRhrrBFry7GBLyb1W9E+p3Hn3SVzjzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lAHBtZAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SJvjH/oV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662C3dE5389775
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RTdcvknL6Wp+U+QrI8TFp2qf
	owIOTbg905V9C8MN6E4=; b=lAHBtZAVloEXdegk2Mt6YCZ6lMrH+L4GiE+tOnQY
	2FTsAGFJIXm93KgNfSm7a0kU3spJm2m4Min2pM11GvDwpNEZ8AD0rqZWONJHP19p
	eGM/MiOL1z4pcvsEVXWtr2hY4ZrnVd508Zc4H/iJW8r6WFOrEQ2Cveq1Dzb75rDS
	9VLLy63IT4l2BTrbPiRmpY4S4vM1o5LnDBu5aCjbszgzxtSj76P+ewXaZ2/wrhmo
	/0wIW8nZCx+6oLuiiwZyEGo2fAz68R2sWj8v3V4Tn3FhXDmsJcz8l3jTBME6t9tg
	v3Zt5C58d6SbCA+CjJvjPicwLJ4KgNSXFYHO7jkrub5edw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp8578-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:39:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e73fc29bfso279777085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995984; x=1783600784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RTdcvknL6Wp+U+QrI8TFp2qfowIOTbg905V9C8MN6E4=;
        b=SJvjH/oVkxFYmK8lM1V+X8vBPq/RaWXAv2lAPDkjZGKRnBCap4AkYtBSq0cBeMrFio
         8mZ4dBbc9ysG67dY15H+NL9jir1Hs00WQV8yVAnVeyzbUWy8X2A7+MnrPtpz1s0Lta1H
         7rAUrINxdbZ3i0M4jpmghjnr0aEXuznw5vXdNp1kL5t/JnCuTu/7kyZgSR0xFvXwR+qe
         ngqNKOv2ijGWwubkRidtGQo9CTyj6EQ0/bs6+9GB2evi7bxh5AvSABMnKRDVtEI8kWLR
         JcqL+X7bzh6EB2ZZc83AEXBIwNonLS3fGsEJktpypHgbjR4p5WW5+ibxC5uQf+vLWQrn
         GvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995984; x=1783600784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTdcvknL6Wp+U+QrI8TFp2qfowIOTbg905V9C8MN6E4=;
        b=qfi3ekF70++DK7MJUNty+DzEqqtwxj1FnMyLj9N3lyRQfdViUa0ajfLofo03GCT2P8
         fvi3ar6nhiLe8htm5HDE/pcKOHqV9/ZY5wqLbAjq6RiZR+AmfCZe5XPQpLRthziQA9lT
         ujEZvwNhiskdjHpQJswsy44eWmX4Opx6L8ddHb7+C+9soJ0/xaT8ZZ+mC0ob85WHz/zm
         4Owy6C38UjlGj/MuDIUXLa58mgLSY5YEgY8T8ci8LPKkxNvT7leRSY36l0+LbLa5aVh2
         Werab8BhQ3T8gzuuCEWNvD5LkPuN4l8HlXRiqZGY4LfL31cuV7VBe5qaGMD4EphV5j0O
         VfXA==
X-Forwarded-Encrypted: i=1; AFNElJ+9/Bp+25fG8Flmp0xVnY+f21MDiw48JCyds8MJoHRb6TafJf8h9BLPHll2GxhdHmmUdCK9FE62p/wLzCNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDRlxNK5jXdJYUWrXp74BKxPB797m19FuAD+uGOFbQULURTFf
	GFIUAUGtkDtcHzDoOITHebWedWPmmLgxfMZA83mNG9wgSWX2NZBz8jHZtJDdjzE2ckcrV8PGsQs
	95BMlVM0oBvBW5FCnHZMrXV2hKpvIVJOoWjUhyORKQINq09AvB5iTw9tVVxeTOOjEp1ve
X-Gm-Gg: AfdE7ckH7A5CNcreQgTgVOw/62P0IN7q6jZGY+crs3I0FtQWHgfcpQnpKMLqzodZcwR
	iD+AfPRvW2IT7OT198I7qoAOV5BOpx05huyn/wjxb3iKiYHtTnjcE4vclrgbrmj5wnVD0KQIqnX
	/3M5Qw+GipDGlQVCKrlxEq/hg2v4YYcbYwQW36LeYoyHWKfa/CoV4CP4q3rsPCgbuRC6PBgLE2a
	eBaO6HlhYg9f7G4P5T4miCxzWCRf/fUhU7yZxVboZN5G44XUuyCZU8opxIDPIlaiel2bxWs+Xrf
	S7GTYKNklKg7Nt12sDPo2y+T+LqxopBBzR07SqKPkc0ZbYPcv1KBlUEahhBy+XIHgzZOrHd40Bo
	6nU5Ih9gytLzW5Qz6C4cEmoqP76KQn325yY8VGVRZ4sVPRZhNe8stgD8RyHBKoTfq5e4oz+zpfy
	MSFvLhCQd05AXQI0Pi77EZmaJ9
X-Received: by 2002:a05:620a:318d:b0:92e:6b16:6a0a with SMTP id af79cd13be357-92e784d1671mr791013685a.40.1782995983535;
        Thu, 02 Jul 2026 05:39:43 -0700 (PDT)
X-Received: by 2002:a05:620a:318d:b0:92e:6b16:6a0a with SMTP id af79cd13be357-92e784d1671mr791007785a.40.1782995983032;
        Thu, 02 Jul 2026 05:39:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37ec294bsm5709091fa.9.2026.07.02.05.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:39:41 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:39:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Message-ID: <ilxihjwdxjbw2nikrks4okxrb5ylgoidsx4ndlyhmkexzapqlx@vtkvfpbhtcjl>
References: <20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX6ULY0t06QoQA
 N26PNyck6mN5UuEpb5ZGHhRZM5Z9Dp/0ZvP2G5X99a/Wo6N22UQ9IEisN0dbOPK9S6mFDYTMAId
 Gs4FpeXingF+SxB8Nfp3DG6k20FCprM=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a465c10 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=-iyMYkqKj0NW7UPWl3cA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXyH6Wq0LPnsZV
 Q6BL0esn2lrh1tTHENn3ypOsZ97VDvuu2LWZ7+MvkfhY6bmJAmwF1PSvOeGBLfyAYXIlpsWaMWD
 abPKbYLCZl34wYoYwGVYXNujkA+7wTZRtANzuLe1jqAY8v1rmrpDxMl5NdeA8xvTNd413V1N99m
 YB4IAskFFBcJJgCA8YfS1CWZEqXDmzNRhnElAbT3Wrg8UL0JFAOXliuc8pH5eCR3H8sjSUPCj2R
 pdG9jKBdxbsFynO0hdhVnIic+DSIHQzSpZpSUHb2DU2Sh9BqjU59nKqDJoLUshEJxYGoP25vvgV
 qMXT5Lp1gwUgomsdxG47NgxZZQcQz/LtlWqoEcw2UaRyKcLc6dKKp280bZWDC4z+0Us0SZ/Sshm
 oA+cMH361DhAPAkDkuStJa8M48wj5tCqTR0E3KmV7aN2HPp86iX7m/XcCaPYIopZ8IXnmsMEQp8
 ID3Nax4BdichzE/mv8g==
X-Proofpoint-ORIG-GUID: rSJ9hqDTts6ggdvp8uTFU0f7K7pSWjXh
X-Proofpoint-GUID: rSJ9hqDTts6ggdvp8uTFU0f7K7pSWjXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116023-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kancy2333@outlook.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,outlook.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,outlook.com:email,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AAF86F7DED

On Thu, Jul 02, 2026 at 11:33:16AM +0200, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on follwing bindings, all reviewed:
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v7-1-16edddda9951@linaro.org/
> - https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
> ---
> Changes in v3:
> - renamed backlight label and node as "backlight"
> - reordered pinctrl properties
> - added regulator-boot-on to display regulators
> - Link to v2: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org
> 
> Changes in v2:
> - Update for bindings changes
> - Remove empty line
> - Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
> ---
>  .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 244 +++++++++++++++++++++
>  1 file changed, 244 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d..56818fc9edbf 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> @@ -220,6 +220,23 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
>  		pinctrl-names = "default";
>  	};
>  
> +	sy7758_vdd33_reg: sy7758-vdd33-regulator {

Heh. regulator-foo-bar would have been a preferred form, but i see that
the existing one doesn't follow the pattern already. But then your chunk
is incorrectly sorted.

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "sy7758_vdd33";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +
> +		gpios = <&tlmm 163 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vph_pwr>;
> +
> +		pinctrl-0 = <&sy7758_vdd33>;
> +		pinctrl-names = "default";
> +	};
> +
>  	sound {
>  		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>  		model = "SM8650-APS2";
> @@ -986,6 +1003,14 @@ gpu7_active: trip-active {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {

&gpu_zap_shader { firmware-name = ".../"; };

> +		firmware-name = "qcom/sm8650/ayaneo/ps2/gen70900_zap.mbn";
> +	};
> +};
> +
>  &i2c3 {
>  	clock-frequency = <100000>;
>  
> @@ -1016,6 +1041,30 @@ wcd_usbss_sbu_mux: endpoint {
>  	};
>  };
>  
> +&i2c4 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "goodix,gt911";
> +		reg = <0x5d>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <162 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&tlmm 161 GPIO_ACTIVE_HIGH>;
> +		VDDIO-supply = <&vreg_l14b_3p2>;
> +		AVDD28-supply = <&vreg_l14b_3p2>;
> +
> +		touchscreen-size-x = <1440>;
> +		touchscreen-size-y = <2560>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts_reset_default>, <&ts_irq_default>;
> +	};
> +};
> +
>  &i2c6 {
>  	clock-frequency = <100000>;
>  
> @@ -1053,6 +1102,51 @@ redriver_ss_in: endpoint {
>  	};
>  };
>  
> +&i2c9 {
> +	status = "okay";
> +
> +	/* Screen power */
> +	regulator@3e {
> +		compatible = "sgmicro,sgm3804";
> +		reg = <0x3e>;
> +
> +		pinctrl-0 = <&sgm3804_default>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vph_pwr>;
> +
> +		sgm3804_pos: pos {
> +			regulator-name = "panel-avdd-pos";
> +			regulator-min-microvolt = <5200000>;
> +			regulator-max-microvolt = <5200000>;
> +			regulator-active-discharge = <1>;
> +			regulator-boot-on;
> +			enable-gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		sgm3804_neg: neg {
> +			regulator-name = "panel-avdd-neg";
> +			regulator-min-microvolt = <5200000>;
> +			regulator-max-microvolt = <5200000>;
> +			regulator-active-discharge = <1>;
> +			regulator-boot-on;
> +			enable-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	/* Backlight */
> +	backlight: backlight@2e {
> +		compatible = "silergy,sy7758";
> +		reg = <0x2e>;
> +
> +		pinctrl-0 = <&sy7758_default>;
> +		pinctrl-names = "default";
> +
> +		vdd-supply = <&sy7758_vdd33_reg>;
> +		enable-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
>  &iris {
>  	status = "okay";
>  };
> @@ -1065,6 +1159,93 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3i_1p2>;
> +
> +	qcom,master-dsi;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		status = "okay";
> +		compatible = "ayaneo,wt0630-2k", "renesas,r63419";
> +		reg = <0>;
> +
> +		pinctrl-0 = <&disp0_reset_n_active>;
> +		pinctrl-1 = <&disp0_reset_n_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		vddio-supply = <&vreg_l12b_1p8>;
> +		vdd-supply = <&vreg_l11b_1p2>;
> +		vsp-supply = <&sgm3804_pos>;
> +		vsn-supply = <&sgm3804_neg>;
> +		vci-supply = <&vreg_l13b_3p0>;
> +
> +		backlight = <&backlight>;
> +
> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +
> +		rotation = <90>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				panel0_in_0: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@1{
> +				reg = <1>;
> +				panel0_in_1: endpoint {
> +					remote-endpoint = <&mdss_dsi1_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel0_in_0>;
> +
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1i_0p88>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi1 {
> +	vdda-supply = <&vreg_l3i_1p2>;
> +
> +	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> +
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi1_out {
> +	remote-endpoint = <&panel0_in_1>;
> +
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi1_phy {
> +	vdds-supply = <&vreg_l1i_0p88>;
> +
> +	status = "okay";
> +};

DSI is after DP

> +
>  &mdss_dp0 {
>  	status = "okay";
>  };
> @@ -1390,6 +1571,20 @@ sw-ctrl-pins {
>  		};
>  	};
>  
> +	disp0_reset_n_active: disp0-reset-n-active-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	fan_pwr_pins: fan-pwr-state {
>  		pins = "gpio125";
>  		function = "gpio";
> @@ -1411,6 +1606,20 @@ fan_int: fan-int-state {
>  		bias-pull-up;
>  	};
>  
> +	mdp_vsync_active: mdp-vsync-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync_suspend: mdp-vsync-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	upd720201_avdd33: upd720201-avdd33-state {
>  		pins = "gpio123";
>  		function = "gpio";
> @@ -1440,6 +1649,13 @@ gamepad_pwr_en: gamepad-pwr-en-active-state {
>  		output-high;
>  	};
>  
> +	sgm3804_default: sgm3804-default-state {
> +		pins = "gpio58", "gpio59";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
>  	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
>  		pins = "gpio77";
>  		function = "gpio";
> @@ -1454,6 +1670,34 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
>  		bias-disable;
>  	};
>  
> +	sy7758_default: sy7758-default-state {
> +		pins = "gpio164";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	sy7758_vdd33: sy7758-vdd33-state {
> +		pins = "gpio163";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	ts_irq_default: ts-irq-active-state {
> +		pins = "gpio162";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	ts_reset_default: ts-reset-active-state {
> +		pins = "gpio161";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-down;
> +	};
> +
>  	wcd_default: wcd-reset-n-active-state {
>  		pins = "gpio107";
>  		function = "gpio";
> 
> ---
> base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
> change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
> prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7:v5
> prerequisite-patch-id: 901a0948e1afbb03ff78a063d4f66c17665588ef
> prerequisite-patch-id: 5ca959a92d05c86ae7a77400d5c4c9bb8bb214f4
> prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25:v5
> prerequisite-patch-id: dd1c5acff71bcfe0730472051c0a5c7c339e2116
> prerequisite-patch-id: 30e1bf23756ac7de0e29e4c30e7c9737366cf856
> prerequisite-change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-r63419-e72467e2db0f:v8
> prerequisite-patch-id: 53130195c1df5886a953f3eb1ffea6e5b32257ec
> prerequisite-patch-id: 016545217702b15d67b3ac48392c2978fc04b000
> 
> Best regards,
> --  
> Neil Armstrong <neil.armstrong@linaro.org>
> 

-- 
With best wishes
Dmitry

