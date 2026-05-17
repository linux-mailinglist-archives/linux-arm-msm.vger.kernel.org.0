Return-Path: <linux-arm-msm+bounces-108065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODSpHGIFCmqkwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:13:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7749A562F25
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C91553006095
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ABB3BB12E;
	Sun, 17 May 2026 18:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/luTTRS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoGtqcNK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B303C0625
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041624; cv=none; b=TekL68L+CtUKrP6Gw07lrelauFo4KaUtmeclOOBhA887yFPGYEQLnWwTQw55qZwd33L2Z/CU2n0+UHiJr4d1LdQCtrTaaFfUdvc84aRMeuCYGZho6KDbqPUk3ebH/VXC2r32IpvoECrTLyax8JDOXzAoXHck3PFp3yY7Xj5DDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041624; c=relaxed/simple;
	bh=8eVmxtcYmSeoUBzl3bHvfv6EisD5Oywosw3966cGgXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8nZm4ToT7xP+45GhfDY8RT1ENHWqi0+u4r3fjGZsF5ZYGCkluV8UrgmbFfhGz1JXFnnQYo23M6tIoYlVaBsrjieNAkJs0V8UZl65EV/ocOoXKEdmzt27bS1uXe8hM5QSYr9+XKPBFCWO7I17aXoKN8zvpAWnT0lI5JNedS1IwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/luTTRS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoGtqcNK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HD0g2N3595369
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Qv0uuV8Ex5OvKUJ759UY79R
	1wNp48m7rDkw4nsWu9A=; b=T/luTTRSCy6ThZnqIMq4Yv9t7QpQoo3sMj3NuAPs
	RfWctSvaJ1iz8NPlEmCJxGfPfEaLbU/o6srfIXsRyDzyj/WfigponPfPIqjUJdia
	8QF0U4Go3zbojf6o5Jn1DgtCS33XiUZYfw/BqPIRxGRH+AJBdh2XCYluPWmsk86F
	TVpSGq/sBx2kRcUdD6r9jk9uKsC7k6Hw+ut6Xjbde5VS2NNbrETq38gtMpq1koWI
	IJZ0S+Wu0kgDCe7OcjRlAgv3vBu+PQX0eX/XPqvcPEVXo1zb7mzXhejUj4cJickR
	5vyVHRuVAmCRA5/v9kM9GTEQ+Fxd2iP2J8gOkhMVD/npaA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw3b7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:13:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so18138296d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041621; x=1779646421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Qv0uuV8Ex5OvKUJ759UY79R1wNp48m7rDkw4nsWu9A=;
        b=eoGtqcNKKy2dptGtrTNgKWXbnNe1bwR+OVEyw+1BQj7m8nB1hrjm9d+ZfKAw4uH/HS
         1KyClEIoQEqFfcIXiAEMhl6UEpaeWF0UK52xZ0OOcNdqqgfR98VUwriRfS2628ovBsat
         wjTiJr6715TgPwDMjzexAZB8f8NWHUNp0tN0zqtIRC3PqmVue7iVHnZtdCBfcf+oNrKU
         Ei5mphVgHmW7FOC0fqk0e/3D8Tz4uvFso+ILSZOtTRIkJoiMUzVLmhN4kQ3y5hsY79gz
         0MuGo8cZ7/eLQxqbWxEQ7+bb86zzhLQuKcX/pHTLl1GCnsXuLF1spkMTOFRqyurd4US3
         T+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041621; x=1779646421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Qv0uuV8Ex5OvKUJ759UY79R1wNp48m7rDkw4nsWu9A=;
        b=TH80arso638gl8kat4nRvT+Z3zgXAYl9RRJw2c5eHqyCY5PN9seLnU7pu60uih0NWM
         DwLrOPVXrDyXZFUQLuivqK4Oyu/FKbyRGimCmKEe+xsc+WPln/acqFZU9mrvAoKMPPmq
         0aGzGiWcFSZjs7ZLkUG+jRB0FOasgLtr4R55gc6vAJJJjeqt0aRiNeA+hZ+eM0yOMdH/
         Zycv10vdJ4SbkHg4RXYxvil8aOiV7WBYi4XbyE019oPCxrWr/4GXc4ogGtOA0Z7X0PUD
         aUxfQKtkAtYHIpKeRUuiQ2LBGULE1JKalgGCZnW0upE99dPs4jni6gFOJtweVngKkuVB
         Q4ww==
X-Forwarded-Encrypted: i=1; AFNElJ9pr9zAttd4kPp1YB3XXEwhwwzZPdR54zT1mBjX4GYamu2WuETtTOLVsfU6mDTHNKFbiJQbCBkncaPajAVZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw6HfZ0MakJ+7MMMszz7KklQ0WpAHrenwq5xpTESojQASEGiLw
	lgGLh7lrGXfZfcEu3kLC5CNVVHZ+oatEhvYGyXOYbz2SUYa0ws6m84HKA6SvBigURvTlffjqLve
	l6D3FYRVRFMPYJyCz3LMtxEh5CDPfhiKE4yacHLAPA8ihzIcH18P7kPlDSSRLKarFmZoy
X-Gm-Gg: Acq92OGYjoA6DQ1jiqLPmH+wySaQpahdPoX/yC9xOJZV6sN+Kax+Sx0rKkH7Bfp5Syn
	MKSV5kByAf3TG7+sZGfIj781GC40kSrx4cTA4xoGwH5pIkPefMk6qm6GKijGBTlWXemQicA9EBp
	0ci/nHm30oEuK6vV3KpLbX5hoVie7YozG3iYyvducziNpu5nZrmw4+Ogqq7CXGdyAX4jwk5rBXT
	siohMpwc6iWJAPByf1n/8ERSIxwMFXkyMssXWXpU64uOo/nLUp6LOPQoo359FOVgHsobY0NJzhs
	5EDCYA4m7G8G6Om6bTgysqMrtvQ2sXU6vS1RyKtWq6rewD8vzESBWjvdjhaTBLg7XcxrEBzG5y3
	f/vc5yCkmbXfld56ay7a3HBurgVEeA8XpMADOL+hCRTgQ5ngqFEBGLZXqSeFaDRZucCSWWQcpmL
	nkT9shWy79kiJTt7wWOh5wKStYJYWHyi1kzls=
X-Received: by 2002:ac8:5cc5:0:b0:50e:62ba:3ff7 with SMTP id d75a77b69052e-5165a075923mr178266971cf.26.1779041621522;
        Sun, 17 May 2026 11:13:41 -0700 (PDT)
X-Received: by 2002:ac8:5cc5:0:b0:50e:62ba:3ff7 with SMTP id d75a77b69052e-5165a075923mr178266581cf.26.1779041621074;
        Sun, 17 May 2026 11:13:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c41c1sm6557951fa.12.2026.05.17.11.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:13:39 -0700 (PDT)
Date: Sun, 17 May 2026 21:13:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Oli R <sigmatwojastara@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm display hardware" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER - DB..." <linux-crypto@vger.kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] treewide: replace /usr/bin/python3 shebangs with env
 python3
Message-ID: <u7c5s7dtvzmqteqvrhr5p2a6wc7sdtmhfksw5344grs2gzgot5@n2ybljjcrju6>
References: <20260515180806.246914-1-sigmatwojastara@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515180806.246914-1-sigmatwojastara@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NyBTYWx0ZWRfX50OjJqjttBly
 UWBVCIQd9PkCM3WXi2LpWFg0DMu4NHDI7o9ICYXttBFffN6yj9nkk4jUh65eVLe+pCQE46igIjy
 OO6w/ANcp7p6CO0r4dm9SO/DL94BlO/3Hr7boh8CCuZogI1nGbRAT2C/bHaGkn3+wjlraOrATN6
 quoquAfetemXgHqGvuHyajCpDnTR6j7rb+kTad1kIRIW5QoTkWsR2FFHR4jFhV03IlG5B+KXN5g
 U5idqUGEU+VLTFnZDNAKTgW0gXa1MOpVI7raQp+9+p8SnkXAr97ohjvDlU7HfVjN1c3uBzaeGzH
 AVMbnVpsdaV/coststh3zNb+lbgZiaHdp5kF90ees7BTq8KNBkp0LwzfcgD4fm/pbufw4uTNr2e
 G9GHly3voRGVgUI1Iye8gudUlJRnCYe97q+4iBuTjnm21lDMTQAuXE+zoNxMQisejGXyGTDTOaQ
 kivgfhWKPW58l3rTQRg==
X-Proofpoint-GUID: Wy8D5FV-3nrmwRjhnrdEfMiIpFvJ-zfz
X-Proofpoint-ORIG-GUID: Wy8D5FV-3nrmwRjhnrdEfMiIpFvJ-zfz
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0a0556 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Vby_bzTUFChIRH6wvO4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170197
X-Rspamd-Queue-Id: 7749A562F25
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-108065-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,amd.com,infradead.org,redhat.com,arm.com,linux.intel.com,google.com,intel.com,linaro.org,efficios.com,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[31];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:07:59PM +0200, Oli R wrote:
> Use /usr/bin/env python3 instead of hardcoded interpreter paths
> to improve portability across environments where python3 is not
> installed in /usr/bin.
> 
> No functional changes intended.
> 
> Signed-off-by: Oli R <sigmatwojastara@gmail.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py                     | 2 +-

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # drm/msm


>  scripts/macro_checker.py                                        | 2 +-
>  tools/crypto/ccp/dbc.py                                         | 2 +-
>  tools/crypto/ccp/dbc_cli.py                                     | 2 +-
>  tools/crypto/ccp/test_dbc.py                                    | 2 +-
>  tools/perf/tests/shell/lib/perf_json_output_lint.py             | 2 +-
>  .../selftests/devices/probe/test_discoverable_devices.py        | 2 +-
>  tools/testing/selftests/rseq/rseq-slice-hist.py                 | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)

-- 
With best wishes
Dmitry

