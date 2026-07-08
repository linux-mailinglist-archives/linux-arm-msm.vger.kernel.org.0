Return-Path: <linux-arm-msm+bounces-117484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id geTQKdjhTWpV/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:36:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41AC721E37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:36:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EqtfYnE9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S4mTZxwR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117484-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117484-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81BBB3019A91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E563BED7F;
	Wed,  8 Jul 2026 05:34:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E14C3BCD02
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:34:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488876; cv=none; b=hs/Z02I53YBTUnVRLCAtS2IaNHYL+cKj8BA3zADArrpjI0jh2RW3O9hyYG/yqM7a1nAk00GB2suebYY4hqYLyrVqzkwTv1gVEl8V5Wwxk+nHsD8jQCE3JiBFvzd+CzvrEfU6d5zG4l/tu+qDu8tMCi4g/RbiottT2nTpm2kRN5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488876; c=relaxed/simple;
	bh=RL/Wvj2Mp0n5HJ5Cy6pG6HZOBt2AowIl22lTfZqvl/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hilx1+12+8z4NFlH+KFNS9drere4WcNuRLZtUXU5AMBeem7jjTZ/zdHqQTJ4jPW3RiOgTY1u/HQ0aMpQD9zmsItUIRfSFhowJnvpy+WrIWk4OaV/Mp3YVc9+4WhTrLRkKwN2vggzm5P7keEffVN9LLpU4ppnW26MncN114gIKLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqtfYnE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4mTZxwR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842E6u1508825
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCieFDn9o1/mTKBwZokgs/AnxZFC6Cu9M4cCeHRgDUo=; b=EqtfYnE9jR6VGU4L
	YvdI2c1EaI3rL4BCZXWS7Zo3iHKZIqpJQoNZfsSUxo6NEe8oRbLa5EMTeaRu4voU
	IY1pIizZJPRrLq/hLiu165f0oCyIxIZz4PmDh1RLDU+G31ae54kVZkpL8H9dzi7N
	qUxd9tE6S2sdcUCXsus076nYopGmu0k//mgdILW/Cbpyv0LiKG7ZXO054xRQwWgE
	QO+w2lP8mecmRm+/MjbG17xHONiDgyJ+CAdJSi0hv8CtmtfEuTh370P5IgAuM46F
	h8tCLgRzunwaNw28X3j1P2+8NJGdqyibeRrhaGsHbkAMaogF5HGPvQrCQ9/IHRh8
	USIY6w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5917k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:34:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso660658b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488874; x=1784093674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCieFDn9o1/mTKBwZokgs/AnxZFC6Cu9M4cCeHRgDUo=;
        b=S4mTZxwRmBpU6rTOF7ZM31N0VoZfIQbMg42c8OCp/NX48VINCPHV6K/3rnMi+OTEKB
         NlUm0H60/AFXQ90ozyNiZpBvkaUkUtOFdqyQnrLNKy4Fmb5qakT1fL6A/+/n3PwWGX9b
         T24bByzAY6uHrDxbJDstWad92Fg75LZygoT5bRdoDccXDKTP5afn8QW+fzpxgbMlhHf4
         sRdW81O1H9n+BiPuZVZC42aYvl2zi7Nij7YVxY7Q9HzSKQjyFVSwZPnkpjjxgr2IcVfA
         x69PyIpUswftToK+1Lz6t5q7wt4zujqVxQkvj+CTMLeaORih4QB3vOa0LrMPBQeUiCPP
         wpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488874; x=1784093674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCieFDn9o1/mTKBwZokgs/AnxZFC6Cu9M4cCeHRgDUo=;
        b=ef/I3FCc1Mn2CL+oTJU7X05b4LtyoLw+Dcllq3YeoZbrWkC5qLI+GS+fqKwGucJB60
         /lHMW/85rz1SASu4aC3vmF9TUgOdhJ4tp1e3GqdTE3NuKiGgaBmGFnwfeldbInqzoOL0
         cvITx5YE/EOogmJfLFA+tan9NtD1Rfrl2t+RFusRzn13eBlNroqVIdBsPrQf4+PsBZlw
         lIPOcLsFIyYJ8Q9NB12EzaEYAmrQehs9eBTG74Es4rr3OgEwx+rsRfAEi0e9Ts+SaV7g
         y4yBDsANSP3yFthfRuXDTTHPNO0BYy2/t61KwkFxtHPsG0GQlySJPfctKl7INVaddlbP
         tzfg==
X-Forwarded-Encrypted: i=1; AHgh+RpUCDgxTHgkHYdbqEnODtfEKmkhiWjacFs7VBiDikesUo90dZ+VaH+MQuJmYD1G+/P4H1O9OyYSxa38auMk@vger.kernel.org
X-Gm-Message-State: AOJu0YxvY2bfugbsllt+heSwBt6mG1ZBbpwQ3/NZWWq29sfveJkxLFaf
	mAt8iF6KNp9RN+WHqal/f4WMNdnDJvVoGZz4B8LHJTK8bDrrlw2gQmE53KmbuNAONt7Sn4gmISg
	fX0Je9LBy6LQSLgKIPH1hs0kp1YMsLyBAJVU7cTvDbeSWWC2ZnAxFM1rckBtjXGT3V5GI
X-Gm-Gg: AfdE7clabkiaAn7eK3EYT8hF1gD6WAXeOO+SdY6zYv20XFyZmWGxOsri3bWrvWzPsN3
	Q81+tYFaAMIsnNZN0RbFJJNB+TNUJ03PvsEqkJCJn7slCEH5KP8E2qqpRZdZyUnkNDLuDTvEQw3
	A3g5tznnHoumXftjynDKwIJDUig2D3Xbz8wFzr7a6RqFDnEsfGRTX+YUM67aX6jV5PlD7Fl99RQ
	hRP8z3yk19fZf+FjVpKVhLUXIJPBdrmeTI/1iQ3tVOywwgJ7Z/C2qPDHo1Msp1BOwqpa/JSWCj9
	T3mOJ705pkMXmjbmIXC0zqmu/YALql5uulE0d2NRlxHKjdnYUIMCMRu4+ZytpnfmnipEPDdivEd
	KzkavZq5kHHd/fNxUQj7riQCyI4x5HC6S3mEBmg==
X-Received: by 2002:a05:6a00:c8c:b0:847:902a:57b5 with SMTP id d2e1a72fcca58-84843675521mr1352964b3a.35.1783488873946;
        Tue, 07 Jul 2026 22:34:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8c:b0:847:902a:57b5 with SMTP id d2e1a72fcca58-84843675521mr1352904b3a.35.1783488873305;
        Tue, 07 Jul 2026 22:34:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:34:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:48 +0530
Subject: [PATCH v3 09/26] mm/page_alloc: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-9-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=944;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=L6c+15QWfJQlsN7pofG7oj9ERof+W0cwt812FgtujDc=;
 b=l1lEkLsA4P0Av7A6H60+TWCYPTjtTVceVA79u4NAHGXJ0OzlnegIIncayRRiyD3tgW/XBu0j3
 S5WBgcBHx3qDeX1/wpk1pjLIXGINMHFVPzaNC/c9Fa6/35YeFUeYUZv
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4de16a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TiJDLkziv7N9Y1Svq3wA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX3PCdXuNRGtNT
 WIcCPUjWNk6UmoadlzqD6H1SMhYFIOU4itIg8D3rhuneKHH92KiZhQPhu4cn4mMrssBoHeYgrRl
 mnFSsktNhyBcTX2OM+T2lN3Ue4CBng4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX9iUtDazmRoBE
 6Aehd834caIbhdanPdN7yF1y4M63Y8Lvxrw8rj93gKv01QYmxXdi2g9E88G2riKvrUT9T/auOsm
 Tt6Mu7nXV1BOqc6Umebki2w9ovj7yRrYrnAdXcu4n2EDR/zwpHnfyis9XJzB5ZPOEcyCPbQCFwo
 B6ch158Ut7Y9v5i2zLp0Iqbl3BPXt2LX+GBv7b6tePUSqMgbxEvR+l8U48dJjnFv2VI8zFt+DM0
 drBBMwHBYAMoyVhDFPQOmgXhl3G5dUyzw/zZEf5jmq1pZxKcfUynZBpMZa6L321xhJ3ZhW3Mus8
 VEF/jF/O6aK+2WuK5+neu+ksCdU8FhVgO56BlEPtcwatwrrLud7wIlOcIduoTWrwxvM9uqlBycP
 jQ+uaE/U5ZTKDgKr/bNV8hM0Y2cK69NF/FKj1J6K9v6ax8ZkRwXow+hBkdNtUys04w+viVESiuT
 MUDSVkvihRWyBroO0oQ==
X-Proofpoint-ORIG-GUID: BLLJl1Q0bNjwNUGlEAb2QyIn5lDDjV-G
X-Proofpoint-GUID: BLLJl1Q0bNjwNUGlEAb2QyIn5lDDjV-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117484-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m
 :andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,oss.qualcomm.com,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A41AC721E37

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - node_states

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a63733dac659..70c5e0794efa 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -54,6 +54,7 @@
 #include <linux/delayacct.h>
 #include <linux/cacheinfo.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/meminspect.h>
 #include <asm/div64.h>
 #include "internal.h"
 #include "page_alloc.h"
@@ -204,6 +205,7 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 #endif	/* NUMA */
 };
 EXPORT_SYMBOL(node_states);
+MEMINSPECT_SIMPLE_ENTRY(node_states);
 
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 

-- 
2.53.0


