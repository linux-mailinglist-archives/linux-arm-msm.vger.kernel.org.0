Return-Path: <linux-arm-msm+bounces-117642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nb/+J81RTmq8KgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:34:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA197726D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:34:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pa09iNox;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CQYtUXNC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117642-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117642-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B21743008895
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD3F37701A;
	Wed,  8 Jul 2026 13:34:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6CC2405EB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:33:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517643; cv=none; b=OyaqI6tNGB5K4sYK1bfUPzmpVJYB4vFRUoLrCmjv1Pk13lwjhmrYhbcf2lv/a825vqptlbPEv5BZb1kdtLgUS2wMcxDDkuQAYV9LKQQIL8PYCMC8b0Fu9J6p+kf01gE2dTErbGGXjSmV7NgNKoySUAO2SpEu3d+cAB/VrN0C51Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517643; c=relaxed/simple;
	bh=CRjLrBlvoU95OPwc7sEbo9HXkZq4tdXIP4mXDfcwQbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FksPYPEybt6fovZ+Fw/mit7zA+7iwaVv2FOoCLkkei3NNHDl/Nss8XMcPaii3h09FiopE+3kOqhWqwhotQcd52kIsEKEmeh97Zko9NyDpRYrMYBwEhs3ZkgwZW0klfMVukPIpo1887kWq+sf0Yx3JA6UNpml5gD3y9lMEDThKfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa09iNox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQYtUXNC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3eq02758834
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRQynWna6sRRY09ddhiwfcGdZVllZvwJvTf0JuNMmDs=; b=pa09iNox1RBbGNDJ
	r/AZCAnIBytaT20TK6Qw9Bd81qfxRpEpU8WOtGE0KPxrodZYQx2FVBI0NjLkO5ND
	QDzFlNud6dRGybMiFUPM16RcGfWFtTmC5JknJpzBO4W4fcbLGXFo9drSd/7U1Mz6
	PT+jLZyUt0JWqfFMtkmXy6/l5dKrogb4eQcMQ0WuoCdZbC3HxvgmcAtjx1IdvfZN
	8fiX4HM9oD0YgkX2IReXKkNqI8K6eAmPMkx8IfBSOLqsshzGpKNvewbXmL2Vlh24
	GipAsHy9AmzYEnyjH2EHmxCwIaentIlJ9N8X9sPCbR2QS9hzxR7tF+SuoBVTJe9v
	Mm4xfg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5vmup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:33:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so727714a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783517636; x=1784122436; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRQynWna6sRRY09ddhiwfcGdZVllZvwJvTf0JuNMmDs=;
        b=CQYtUXNClsKX/ElGFvOJnk8aTYImJrG47xA0vRzYiaKuztdVDlGbTcplpTe/6XkRV2
         7/agwszrcfjccJlDvFvabFpjUPypgRf6sh3ZLxOyhW4H487EhloMJRbDC+Cjoi/fW2iP
         O/4NVzbDeVWqsuFsSPqHCRDSZ9McP65CpBeHMBVbFLGyKnVJ6PBnV9JsUe+/ynPOSqJ1
         XSyyjbmVuW4D+2z1E0c9c0+j6DUNAj38qhEiopaNerzpu1vQxg01Mcl2BzzejiX9oxKw
         F8womlDkKgn0qs/PZSDl6xGKGBZ0PDCFjOw9rUpjd9xqz43E5Hd3lyOHmk6Qlu+fFToa
         J5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517636; x=1784122436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IRQynWna6sRRY09ddhiwfcGdZVllZvwJvTf0JuNMmDs=;
        b=UGcGISRGgAADxJav8BIK+v8qMdbbo92c9fInYzqGK+4/JlAQSm2iIdUIEjsZQeXUI3
         +EhdmG9KWqqCq2w7448OO0UYO5bsoyGlq8epj03dhOScVq2TQk4QV9TNPdBUcK6gnOuM
         wHmCKFt2t4KBx30SNumSggLXnWWp81klfbrzpAe5ajrhyaN/K1Gy0oJ2FKEnoaR0EIfm
         T3tR80UOtC1Kk4QyIWxQW/CXnHZ8H0S58MNupFlHpK31IH1JBhh3sOzbrt3sPF/wc8O2
         Fm+ceztiDByhfRp4MGHRob2Nip+tcpOTwpKoGaOocaDpcxrhyo3I2Vkhi0rFy6RY+8cj
         ROHA==
X-Forwarded-Encrypted: i=1; AHgh+RoG+onWz/auti+Ko5gd3BLvrIEBpP0+s2XHNvhRelHbkZ384i93BEFZfkRhEw2w0mIgFkticZnHrrcuiWC0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3JatzwOlPgEYGOpbmzNV2ACFaJIb4uq0WZxr4b75rOBfUifrY
	5GoQCEQXllvKaBl7YhQHJ8tkwTJb/NwWkLo781Q3I5q/LzNzoLEeF5nxuIxW0CpU4/g6SgtZ7yB
	yz+HwTF5Q1amVjCyWajD7ypRWMmLfN91qP6YejIjWE5tUGRIrwecDM1yR5W1fZYzCzRlb
X-Gm-Gg: AfdE7ck8tihpEejvGHn8cOY1782Df+qRRwXPM+7e3vWQUr6/AdcWkdKYJ1EAgvPXC0W
	eFocMmpzuoBD1Hw1wFoe6z8cllsxsUfagwFFkhZ3ozzuYLVpS1YGl98KmFuw3XoPFosrr45MzYW
	ex2JTA1zfP4vYK1djNyIGJsmSFvy4JcSLR4mut/jne9hMF/i8xtC35j6mL6z9nb7QsqrtPezJnc
	ZoQOVt688Ba0wpMnzuHcBLwcNHwCSlqPAXm1iBfL9llCJ7lURzPe6deOi2aiLPc740hYD1N/17n
	fzl7kG0bwXizSJDQSmQSd7Qmc56OB7rgU5VKe8DqHicAn9EEKnGW8Ll5391w7Wzbcb7kK8RdT8S
	1tuNDdc+cguIzOv7W3G36CpEPzrrltehPGuTQGQ==
X-Received: by 2002:a05:6a20:549d:b0:3bf:6c04:a819 with SMTP id adf61e73a8af0-3c0bd19ef66mr3411895637.58.1783517635877;
        Wed, 08 Jul 2026 06:33:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:549d:b0:3bf:6c04:a819 with SMTP id adf61e73a8af0-3c0bd19ef66mr3411808637.58.1783517634778;
        Wed, 08 Jul 2026 06:33:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c865asm21540617c88.11.2026.07.08.06.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:33:54 -0700 (PDT)
Date: Wed, 8 Jul 2026 19:03:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@gentwo.org>,
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
        David Hildenbrand <david@kernel.org>,
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
        Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/26] kernel: Introduce meminspect
Message-ID: <20260708133336.yjpn3tyket6zldt6@hu-mojha-hyd.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-1-7aa5a0a74d5c@oss.qualcomm.com>
 <ak34Q7gIJedcGe5d@lucifer>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak34Q7gIJedcGe5d@lucifer>
X-Proofpoint-GUID: oRzns9tJrl_xmH17jCsGvUVq1zUSmi9y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMyBTYWx0ZWRfX968iNJFAfXzn
 TiflcfNXaDmyNhMya4OSp3c+ayg/3+Yl31DiMlcJoEcLOOBDOlAitGvUNDN23a73agZKGAUlBcI
 C7/xQCvvAn2pLThAYVAg0Z/8tuMoPEY=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e51c5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=37rDS-QxAAAA:8
 a=Y3Laj8ir0quC8G1ZeEYA:9 a=Rhe99fLlrzPB6ALC:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-ORIG-GUID: oRzns9tJrl_xmH17jCsGvUVq1zUSmi9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMyBTYWx0ZWRfX+mWC5HiXoZgN
 dfNGBXjuebfJ7PAjA2dpdUwsNZn5SBkHCSR/C68aJUj0bA1Fc+sI5w3lrrcqK/PfT4nQ4sO/lO7
 Y2jd4F7DmHgRAp8alQoDmHiXknDyxq8xQ8bdLRF4Na/yeFBb4XNlmR6eDu4YBt+Oago1qlz3sYM
 +0HDZGVp32LDq3IOBX4U2ZDp7pVYrf3Qeh5If2EWwfXRK91Muwdksy8vs6l8SHUuK4BHRDoleR3
 VT914vJh1qI3UPtzU1FgbXrBi/okIJOLnfTXZk+0AyDgJJRZ01lvt146Irj45xSWV5JpbyyCI85
 voWn5r3pla6rV4gXNRcy/x9Q4GJDSmxuXFOX+mmOfxH8jKzRaGrrRyCdEaVeZbVDX4JIUj3qKCm
 OjWs5e5X/X9EQivyo5HwAvPjct08X8fm2uer9F/ctKWh277hYdVgMu0c/xoVVN11n15St1GxfDJ
 HM7xcf0KLCo3jdk/UuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117642-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,kernel.org,arndb.de,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,google.com,redhat.com,linaro.org,arm.com,goodmis.org,suse.de,amd.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,linux.dev,lge.com,chromium.org,vger.kernel.org,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ehristev@kernel.org,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:akpm@linux-foundation.org,m:tglx@kernel.org,m:peterz@infradead.org,m:anna-maria@linutronix.de,m:frederic@kernel.org,m:jstultz@google.com,m:sboyd@kernel.org,m:kees@kernel.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:david@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baoquan.he@linux.dev,m:baohua@kernel.org,m:youngjun.park@lge.com,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:andersson@kernel.org,m:mathieu
 .poirier@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[59];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA197726D65

On Wed, Jul 08, 2026 at 08:38:13AM +0100, Lorenzo Stoakes wrote:
> This is an unmergeable mess of a patch but I have broader concerns:
> 
> * I'm very concerned that this is just one giant workaround to
>   EXPORT_SYMBOLS() for unexported memory, or really just a way for drivers
>   to stuff arbitrary VAs/PAs in some global region.
> 
> * I'm also very concerned about memory lifecycle - saying a physical range
>   X-Y is Z doesn't mean it's forever that? And for virtual addresses it's
>   even more problematic - are you going to put vmalloc pointers there that
>   can get unmapped? Or direct map ranges that might end up unmapped for
>   various reasons? What about memory hotplug?...

Static entries (patches 02–21) are all kernel .data/.bss symbols
 init_mm, cpu masks, kallsyms arrays, printk ring buffer descriptors,
etc. These are never freed, never remapped, and live for the full kernel
lifetime. There is no lifecycle issue for these.

The unregister API exists precisely for lifecycle management.  No
vmalloc memory is registered in this series. The only dynamic
registrations today are the ELF header (CMA allocation,
intentionally never freed) and vmcoreinfo (a static kernel
buffer).

Memory hotplug is a legitimate gap for the NUMA node_data registration.
Currently, all the tagged region are required by crash-utility
to launch and get dmesg from the collected elf.

> 
> * I hate the idea of exposing information about physical (and virtual!)
>   memory ranges to drivers arbitrarily, drivers are notorious for doing the
>   wrong thing (TM) and this is just asking for people to do 'interesting'
>   things with this stuff.

flow:

  kernel subsystems (owners of the data)
       │  annotate their own symbols
       ▼
  meminspect table  (PA + size, kernel-internal)
       │  pushed to registered backends only
       ▼
  platform backend driver  (e.g. qcom-minidump)
       │  writes PA+size pairs to SMEM
       ▼
  firmware   ── actual consumer
       │  reads kernel memory directly via hardware privilege
       ▼
  crash dump

The driver should not dereference the addresses. It should not "do the wrong
thing" with them beyond writing them into a firmware-readable table —
which is its entire purpose.

The closest upstream analogy is /proc/vmcoreinfo, which already exposes
kernel symbol addresses, struct offsets, and memory layout to crash
analysis tools. meminspect is a more selective, machine-readable variant
of the same concept, scoped to platforms where kdump and pstore are not
viable (no kexec support, RAM contents lost on reboot, no persistent
storage).

I can further fine tune only restrict to specific backend or remove traverse
or notifier API that arbitrary code can call. The registration can be gated by
backend platform driver, not by an open subscription API.

If the concern is that future drivers will misuse the framework beyond
its intended purpose i.e., a valid long-term worry, and I am  open
to adding documentation constraints or restricting the API further
(e.g., limiting to a single backend registration).

> 
> On Wed, Jul 08, 2026 at 11:01:40AM +0530, Mukesh Ojha wrote:
> > From: Eugen Hristev <ehristev@kernel.org>
> >
> > Memory inspection mechanism allows registration of a specific
> > memory area (or object) for later inspection purposes. Ranges are
> > added into an inspection table, which can be requested and
> > analyzed by specific drivers. Drivers would interface with any
> > hardware mechanism that will allow inspection of the data,
> > including but not limited to: dumping for debugging, creating a
> > core dump, analysis, or statistical information. Drivers can
> > register a notifier to know when new objects are registered, or
> > to traverse an existing inspection table. The inspection table is
> > created ahead of time such that it can be later used regardless
> > of the state of the kernel (running, frozen, crashed, or any
> > particular state).
> 
> This is the complete opposite of what a commit message should be...
> 
> Firstly it's an totally unacceptable, unreadable wall of text.
> 
> Secondly you're not at all describing what you're doing in this commit
> here.
> 
> As far as I can tell from the code here, you're explicitly only supporting
> ELF registered ranges (perhaps static also?)
> 
> I mean this is clearly not the whole thing, despite what the commit msg
> suggests, as you have 25 further commits (!)
> 
> The commit message should explain WHAT THE PATCH IS DOING, the trade-offs,
> the motivation, anything that needs to be called out.
> 
> It does absolutely none of that and instead you get what seems like
> marketing copy in a giant unbroken, unreadable, paragraph.

Surely, I could have explained more about the problem and how it
tries to solve it, and its limitations if any, instead of just
the introduction part.

> 
> >
> > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> This patch is seriously far from being even vaguely upstreamable, and for
> an effective v5 this is concerning.
> 
> > ---
> >  Documentation/dev-tools/index.rst      |   1 +
> >  Documentation/dev-tools/meminspect.rst | 144 ++++++++++
> >  MAINTAINERS                            |   9 +
> >  include/asm-generic/vmlinux.lds.h      |  13 +
> >  include/linux/meminspect.h             | 270 +++++++++++++++++++
> >  init/Kconfig                           |   1 +
> >  kernel/Makefile                        |   1 +
> >  kernel/meminspect/Kconfig              |  18 ++
> >  kernel/meminspect/Makefile             |   3 +
> >  kernel/meminspect/meminspect.c         | 474 +++++++++++++++++++++++++++++++++
> >  10 files changed, 934 insertions(+)
> 
> This changelog is completely ridiculous for a single patch.
> 
> This is kernel 101 stuff... you don't send everything in a single commit
> including documentation + MAINTAINERS changes...!
> 
> You have to split things up into logical parts.
>

I surely did a very poor job not changing too much from version
v1. It is indeed waiting for such comments to be addressed for it
to be on the right path, thank you, will split  it logically.

> >
> > diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
> > index 59cbb77b33ff..ea2989ca1566 100644
> > --- a/Documentation/dev-tools/index.rst
> > +++ b/Documentation/dev-tools/index.rst
> > @@ -40,3 +40,4 @@ Documentation/process/debugging/index.rst
> >     autofdo
> >     propeller
> >     container
> > +   meminspect
> > diff --git a/Documentation/dev-tools/meminspect.rst b/Documentation/dev-tools/meminspect.rst
> > new file mode 100644
> > index 000000000000..4ca10e33e4fd
> > --- /dev/null
> > +++ b/Documentation/dev-tools/meminspect.rst
> > @@ -0,0 +1,144 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +==========
> > +meminspect
> > +==========
> > +
> > +This document provides information about the meminspect feature.
> > +
> > +Overview
> > +========
> > +
> > +meminspect is a mechanism that allows the kernel to register a chunk of
> > +memory into a table, to be used at a later time for a specific
> > +inspection purpose like debugging, memory dumping or statistics.
> 
> What's a chunk of memory? Physical memory? MMIO ranges? Virtual ranges? Direct
> map? Vmalloc?
> 
> Be more specific.

That's a valid concern to be addressed; it should be a directly
mapped region and should be documented and WARN on if it is not
directly mapped memory.

> 
> > +
> > +meminspect allows drivers to traverse the inspection table on demand,
> > +or to register a notifier to be called whenever a new entry is being added
> > +or removed.
> 
> I absolutely hate the idea of exposing a table of pointers to 'memory' that has
> lifetime information to drivers with arbitrary context.
> 
> What about security?

I see a point with the current implementation: meminspect core is
more open in such a sense that anybody can register a notifier
and traverse the table, so it really need not be a device.
However, current users like qcom minidump and google debug-kinfo
are platform drivers. I can fix that by removing notifiers and
having the backend supply ops callbacks, like how the pstore
backend does it.


> 
> > +
> > +The reasoning for meminspect is also to minimize the required information
> > +in case of a kernel problem. For example a traditional debug method involves
> > +dumping the whole kernel memory and then inspecting it. Meminspect allows the
> > +users to select which memory is of interest, in order to help this specific
> > +use case in production, where memory and connectivity are limited.
> 
> Again this is so vague it's uselses...

The intention of meminspect is to get minimal information from
the kernel that gets registered with any backend firmware so that
the firmware can dump it from a field device such as a mobile
phone or any device..

> 
> > +
> > +Although the kernel has multiple internal mechanisms, meminspect fits
> > +a particular model which is not covered by the others.
> 
> This is nebulous nonsense you have to explain WHY and what exactly it gives that
> others don't.
> 
> You can very well inspect specific areas of memory using

Ack, it should rightly explain why the other models do not fit.

> 
> > +
> > +meminspect Internals
> > +====================
> > +
> > +API
> > +---
> > +
> > +Static memory can be registered at compile time, by instructing the compiler
> > +to create a separate section with annotation info.
> > +For each such annotated memory (variables usually), a dedicated struct
> > +is created with the required information.
> > +To achieve this goal, some basic APIs are available:
> > +
> > +* MEMINSPECT_ENTRY(idx, sym, sz)
> > +  is the basic macro that takes an ID, the symbol, and a size.
> > +
> > +To make it easier, some wrappers are also defined
> > +
> > +* MEMINSPECT_SIMPLE_ENTRY(sym)
> > +  uses the dedicated MEMINSPECT_ID_##sym with a size equal to sizeof(sym)
> > +
> > +* MEMINSPECT_NAMED_ENTRY(name, sym)
> > +  is a simple entry that has an id that cannot be derived from the sym,
> > +  so a name has to be provided
> > +
> > +* MEMINSPECT_AREA_ENTRY(sym, sz)
> > +  registers sym, but with the size given as sz, useful for e.g.
> > +  arrays which do not have a fixed size at compile time.
> > +
> > +For dynamically allocated memory, or for other cases, the following APIs
> > +are defined::
> > +
> > +  meminspect_register_id_pa(enum meminspect_uid id, phys_addr_t zone,
> > +                            size_t size, unsigned int type);
> > +
> > +which takes the ID and the physical address.
> 
> What about lifetime?...
> 
> Exposing arbitrary physical memory to drivers is just a big nope.


> 
> > +
> > +Similarly there are variations:
> > +
> > + * meminspect_register_pa() omits the ID
> > + * meminspect_register_id_va() requires the ID but takes a virtual address
> > + * meminspect_register_va() omits the ID and requires a virtual address
> > +
> > +If the ID is not given, the next available dynamic ID is allocated.
> > +
> > +To unregister a dynamic entry, some APIs are defined:
> > + * meminspect_unregister_pa(phys_addr_t zone, size_t size);
> > + * meminspect_unregister_id(enum meminspect_uid id);
> > + * meminspect_unregister_va(va, size);
> > +
> > +All of the above have a lock variant that ensures the lock on the table
> > +is taken.
> > +
> > +
> > +meminspect drivers
> > +------------------
> > +
> > +Drivers are free to traverse the table by using a dedicated function::
> > +
> > + meminspect_traverse(void *priv, meminspect_iter_cb_t cb)
> > +
> > +The callback is called for each entry in the table.
> > +
> > +Drivers can also register a notifier with meminspect_notifier_register()
> > +and unregister with meminspect_notifier_unregister() to be called when a new
> > +entry is added or removed.
> > +
> > +Data structures
> > +---------------
> > +
> > +The regions are stored in a simple fixed size array. It avoids
> > +memory allocation overhead. This is not performance critical nor does
> > +allocating a few hundred entries create a memory consumption problem.
> > +
> > +The static variables registered into meminspect are annotated into
> > +a dedicated .inspect_table memory section. This is then walked by meminspect
> > +at a later time and each variable is then copied to the whole inspect table.
> > +
> > +meminspect Initialization
> > +-------------------------
> > +
> > +At any time, meminspect is ready to accept region registration
> > +from any part of the kernel. The table does not require any initialization.
> 
> 
> 
> > +In case CONFIG_CRASH_DUMP is enabled, meminspect creates an ELF header
> > +corresponding to a core dump image, in which each region is added as a
> > +program header. In this scenario, the first region is this ELF header, and
> > +the second region is the vmcoreinfo ELF note.
> > +By using this mechanism, all the meminspect table, if dumped, can be
> > +concatenated to obtain a core image that is loadable with the `crash` tool.
> > +
> > +meminspect example
> > +==================
> > +
> > +A simple scenario for meminspect is the following:
> > +The kernel registers the linux_banner variable into meminspect with
> > +a simple annotation like::
> > +
> > +  MEMINSPECT_SIMPLE_ENTRY(linux_banner);
> > +
> > +The meminspect late initcall will parse the compile-time table
> > +and copy the entry information into the inspection table.
> > +At a later point, any interested driver can call the traverse function to
> > +find out all entries in the table.
> > +A specific driver will then note into a specific table the address of the
> > +banner and the size of it.
> > +The specific table is then written to a shared memory area that can be
> > +read by upper level firmware.
> 
> This feels like you're finding a way to export things that aren't exported...?!

Umm... The intention was to share this information for debugging
purposes.

> 
> > +When the kernel freezes (hypothetically), the kernel will no longer feed
> > +the watchdog. The watchdog will trigger a higher exception level interrupt
> > +which will be handled by the upper level firmware. This firmware will then
> > +read the shared memory table and find an entry with the start and size of
> > +the banner. It will then copy it for debugging purpose. The upper level
> 
> This feels like a giant workaround to provide EXPORT_SYMBOLS()

Well, it was not an intention to share this with everybody but
with the backend device representing a platform device.

> 
> > +firmware will then be able to provide useful debugging information,
> > +like in this example, the banner.
> > +
> > +As seen here, meminspect facilitates the interaction between the kernel
> > +and a specific firmware.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c3f72058a2f2..fdad8ef377c8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16892,6 +16892,15 @@ F:	arch/*/include/asm/sync_core.h
> >  F:	include/uapi/linux/membarrier.h
> >  F:	kernel/sched/membarrier.c
> >
> > +MEMINSPECT
> > +M:	Eugen Hristev <eugen.hristev@linaro.org>
> > +M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > +L:	linux-kernel@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/dev-tools/meminspect.rst
> > +F:	include/linux/meminspect.h
> > +F:	kernel/meminspect/*
> > +
> >  MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
> >  M:	Mike Rapoport <rppt@kernel.org>
> >  L:	linux-mm@kvack.org
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index 5659f4b5a125..3122ddf5517a 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -506,6 +506,8 @@
> >  	FW_LOADER_BUILT_IN_DATA						\
> >  	TRACEDATA							\
> >  									\
> > +	MEMINSPECT_TABLE						\
> > +									\
> >  	PRINTK_INDEX							\
> >  									\
> >  	/* Kernel symbol table */					\
> > @@ -904,6 +906,17 @@
> >  #define TRACEDATA
> >  #endif
> >
> > +#ifdef CONFIG_MEMINSPECT
> > +#define MEMINSPECT_TABLE						\
> > +	. = ALIGN(8);							\
> > +	.inspect_table : AT(ADDR(.inspect_table) - LOAD_OFFSET) {	\
> > +		BOUNDED_SECTION_POST_LABEL(.inspect_table,		\
> > +					   __inspect_table, , _end)	\
> > +	}
> > +#else
> > +#define MEMINSPECT_TABLE
> > +#endif
> > +
> >  #ifdef CONFIG_PRINTK_INDEX
> >  #define PRINTK_INDEX							\
> >  	.printk_index : AT(ADDR(.printk_index) - LOAD_OFFSET) {		\
> > diff --git a/include/linux/meminspect.h b/include/linux/meminspect.h
> > new file mode 100644
> > index 000000000000..a9eb93c6ea2f
> > --- /dev/null
> > +++ b/include/linux/meminspect.h
> > @@ -0,0 +1,270 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef _MEMINSPECT_H
> > +#define _MEMINSPECT_H
> > +
> > +#include <asm/page.h>
> > +#include <linux/notifier.h>
> > +
> > +enum meminspect_uid {
> > +	MEMINSPECT_ID_NONE = 0,
> > +	MEMINSPECT_ID_ELF,
> > +	MEMINSPECT_ID_VMCOREINFO,
> > +	MEMINSPECT_ID_CONFIG,
> > +	MEMINSPECT_ID__totalram_pages,
> > +	MEMINSPECT_ID___cpu_possible_mask,
> > +	MEMINSPECT_ID___cpu_present_mask,
> > +	MEMINSPECT_ID___cpu_online_mask,
> > +	MEMINSPECT_ID___cpu_active_mask,
> > +	MEMINSPECT_ID_mem_section,
> > +	MEMINSPECT_ID_jiffies_64,
> > +	MEMINSPECT_ID_linux_banner,
> > +	MEMINSPECT_ID_nr_threads,
> > +	MEMINSPECT_ID_total_nr_irqs,
> > +	MEMINSPECT_ID_tainted_mask,
> > +	MEMINSPECT_ID_taint_flags,
> > +	MEMINSPECT_ID_node_states,
> > +	MEMINSPECT_ID___per_cpu_offset,
> > +	MEMINSPECT_ID_nr_swapfiles,
> > +	MEMINSPECT_ID_init_uts_ns,
> > +	MEMINSPECT_ID_printk_rb_static,
> > +	MEMINSPECT_ID_printk_rb_dynamic,
> > +	MEMINSPECT_ID_prb,
> > +	MEMINSPECT_ID_prb_descs,
> > +	MEMINSPECT_ID_prb_infos,
> > +	MEMINSPECT_ID_prb_data,
> > +	MEMINSPECT_ID_clear_seq,
> > +	MEMINSPECT_ID_high_memory,
> > +	MEMINSPECT_ID_init_mm,
> > +	MEMINSPECT_ID__sinittext,
> > +	MEMINSPECT_ID__einittext,
> > +	MEMINSPECT_ID__end,
> > +	MEMINSPECT_ID__text,
> > +	MEMINSPECT_ID__stext,
> > +	MEMINSPECT_ID__etext,
> > +	MEMINSPECT_ID_kallsyms_num_syms,
> > +	MEMINSPECT_ID_kallsyms_offsets,
> > +	MEMINSPECT_ID_kallsyms_names,
> > +	MEMINSPECT_ID_kallsyms_token_table,
> > +	MEMINSPECT_ID_kallsyms_token_index,
> > +	MEMINSPECT_ID_kallsyms_markers,
> > +	MEMINSPECT_ID_kallsyms_seqs_of_names,
> > +	MEMINSPECT_ID_swapper_pg_dir,
> > +	MEMINSPECT_ID_DYNAMIC,
> > +	MEMINSPECT_ID_MAX = 201,
> 
> Err why 201?

Ideally, there should not be any limit, but to add more context,
this was one of the backend limitation and should be removed from
here.

> 
> > +};
> 
> This feels like a bunch of stuff you didn't document?

If it looks worth documenting, I will do it..

> 
> > +
> > +#define MEMINSPECT_TYPE_REGULAR		0
> > +
> > +#define MEMINSPECT_NOTIFIER_ADD		0
> > +#define MEMINSPECT_NOTIFIER_REMOVE	1
> 
> Broken indentation...

Ack.

> 
> > +
> > +/**
> > + * struct inspect_entry - memory inspect entry information
> > + * @id: unique id for this entry
> > + * @va: virtual address for the memory (pointer)
> 
> Err what?? Virtual address as mapped how? Are you now assuming things are
> mapped?

It should be directly mapped virtual addresses and should be
documented.

> 
> > + * @pa: physical address for the memory
> > + * @size: size of the memory area of this entry
> > + * @type: type of the entry (class)
> 
> 'Class'?

Ack.

> 
> > + */
> > +struct inspect_entry {
> > +	enum meminspect_uid	id;
> > +	void			*va;
> > +	phys_addr_t		pa;
> > +	size_t			size;
> > +	unsigned int		type;
> > +};
> > +
> > +/**
> > + * typedef meminspect_iter_cb_t - Iterator callback for meminspect traversal
> > + * @priv: private data passed through from the caller of meminspect_traverse()
> > + * @ie:   pointer to the current inspect_entry; read-only, table lock held
> > + *
> > + * The table lock is held by the caller; the callback must not call any
> > + * meminspect_table_lock() or meminspect_table_unlock() variants.
> > + */
> > +typedef void (*meminspect_iter_cb_t)(void *priv, const struct inspect_entry *ie);
> 
> So drivers can now just access some tagged region, with a VA that err I
> guess we just assume is valid when accessed and a PA that err I guess we
> just assume is still being used for what it was tagged for?
> 

Currently, all the tagged one are trusted as directly mapped
one.

> This seems insane?
> 
> > +
> > +#ifdef CONFIG_MEMINSPECT
> > +/* .inspect_table section table markers*/
> > +extern const struct inspect_entry __inspect_table[];
> > +extern const struct inspect_entry __inspect_table_end[];
> > +
> > +/*
> > + * Annotate a static variable into inspection table.
> > + * Can be called multiple times for the same ID, in which case
> > + * multiple table entries will be created
> > + */
> > +#define MEMINSPECT_ENTRY(idx, sym, sz)						\
> > +	static const struct inspect_entry __UNIQUE_ID(__inspect_entry_##idx)	\
> > +	__used __section(".inspect_table") = {					\
> > +		.id = idx,							\
> > +		.va = (void *)&(sym),						\
> > +		.size = (sz),							\
> > +	}
> > +/*
> > + * A simple entry is just a variable, the size of the entry is the variable size
> > + * The variable can also be a pointer, the pointer itself is being added in this
> > + * case.
> > + */
> > +#define MEMINSPECT_SIMPLE_ENTRY(sym)	\
> > +	MEMINSPECT_ENTRY(MEMINSPECT_ID_##sym, sym, sizeof(sym))
> > +/*
> > + * In the case when `sym` is not a variable, but a member of a struct e.g.,
> > + * and we cannot derive a name from it, a name must be provided.
> > + */
> > +#define MEMINSPECT_NAMED_ENTRY(name, sym)	\
> > +	MEMINSPECT_ENTRY(MEMINSPECT_ID_##name, sym, sizeof(sym))
> > +/*
> > + * Create a more complex entry, by registering an arbitrary memory starting
> > + * at sym. The size is provided as a parameter.
> > + * This is used e.g. when the symbol is a start of an unknown sized array.
> > + */
> > +#define MEMINSPECT_AREA_ENTRY(sym, sz) \
> > +	MEMINSPECT_ENTRY(MEMINSPECT_ID_##sym, sym, sz)
> > +
> > +/* Iterate through .inspect_table section entries */
> > +#define for_each_meminspect_entry(__entry)		\
> > +	for (__entry = __inspect_table;			\
> > +	     __entry < __inspect_table_end;		\
> > +	     __entry++)
> > +
> > +#else
> > +#define MEMINSPECT_ENTRY(...)
> > +#define MEMINSPECT_SIMPLE_ENTRY(...)
> > +#define MEMINSPECT_NAMED_ENTRY(...)
> > +#define MEMINSPECT_AREA_ENTRY(...)
> > +#endif
> > +
> > +#ifdef CONFIG_MEMINSPECT
> > +
> > +/*
> > + * Dynamic helpers to register entries.
> > + * These do not lock the table, so use with caution.
> > + */
> > +void meminspect_register_id_pa(enum meminspect_uid id, phys_addr_t zone,
> > +			       size_t size, unsigned int type);
> > +void meminspect_table_lock(void);
> > +void meminspect_table_unlock(void);
> > +
> > +#define meminspect_register_pa(...) \
> > +	meminspect_register_id_pa(MEMINSPECT_ID_DYNAMIC, __VA_ARGS__, MEMINSPECT_TYPE_REGULAR)
> > +
> > +#define meminspect_register_id_va(id, va, size) \
> > +	meminspect_register_id_pa(id, virt_to_phys(va), size, MEMINSPECT_TYPE_REGULAR)
> > +
> > +#define meminspect_register_va(...) \
> > +	meminspect_register_id_va(MEMINSPECT_ID_DYNAMIC, __VA_ARGS__)
> > +
> > +void meminspect_unregister_pa(phys_addr_t zone, size_t size);
> > +void meminspect_unregister_id(enum meminspect_uid id);
> > +
> > +#define meminspect_unregister_va(va, size) \
> > +	meminspect_unregister_pa(virt_to_phys(va), size)
> > +
> > +void meminspect_traverse(void *priv, meminspect_iter_cb_t cb);
> > +
> > +/*
> > + * Producers, or registrators, are advised to use the locked API below
> > + */
> > +#define meminspect_lock_register_pa(...)			\
> > +	do {							\
> > +		meminspect_table_lock();			\
> > +		meminspect_register_pa(__VA_ARGS__);		\
> > +		meminspect_table_unlock();			\
> > +	} while (0)
> > +
> > +#define meminspect_lock_register_id_va(...)			\
> > +	do {							\
> > +		meminspect_table_lock();			\
> > +		meminspect_register_id_va(__VA_ARGS__);		\
> > +		meminspect_table_unlock();			\
> > +	} while (0)
> > +
> > +#define meminspect_lock_register_va(...)			\
> > +	do {							\
> > +		meminspect_table_lock();			\
> > +		meminspect_register_va(__VA_ARGS__);		\
> > +		meminspect_table_unlock();			\
> > +	} while (0)
> > +
> > +#define meminspect_lock_unregister_pa(...)			\
> > +	do {							\
> > +		meminspect_table_lock();			\
> > +		meminspect_unregister_pa(__VA_ARGS__);		\
> > +		meminspect_table_unlock();			\
> > +	} while (0)
> > +
> > +#define meminspect_lock_unregister_va(...)			\
> > +	do {							\
> > +		meminspect_table_lock();			\
> > +		meminspect_unregister_va(__VA_ARGS__);		\
> > +		meminspect_table_unlock();			\
> > +	} while (0)
> > +
> > +#define meminspect_lock_unregister_id(...)			\
> > +	do {							\
> > +		meminspect_table_lock();			\
> > +		meminspect_unregister_id(__VA_ARGS__);		\
> > +		meminspect_table_unlock();			\
> > +	} while (0)
> > +
> > +#define meminspect_lock_traverse(...)				\
> > +	do {							\
> > +		meminspect_table_lock();			\
> > +		meminspect_traverse(__VA_ARGS__);		\
> > +		meminspect_table_unlock();			\
> > +	} while (0)
> > +
> > +int meminspect_notifier_register(struct notifier_block *n);
> > +int meminspect_notifier_unregister(struct notifier_block *n);
> > +
> > +#else
> > +static inline void meminspect_register_id_pa(enum meminspect_uid id,
> > +					     phys_addr_t zone,
> > +					     size_t size, unsigned int type)
> > +{
> > +}
> > +
> > +static inline void meminspect_table_lock(void)
> > +{
> > +}
> > +
> > +static inline void meminspect_table_unlock(void)
> > +{
> > +}
> > +
> > +static inline void meminspect_unregister_pa(phys_addr_t zone, size_t size)
> > +{
> > +}
> > +
> > +static inline void meminspect_unregister_id(enum meminspect_uid id)
> > +{
> > +}
> > +
> > +static inline void meminspect_traverse(void *priv, meminspect_iter_cb_t cb)
> > +{
> > +}
> > +
> > +static inline int meminspect_notifier_register(struct notifier_block *n)
> > +{
> > +	return 0;
> > +}
> > +
> > +static inline int meminspect_notifier_unregister(struct notifier_block *n)
> > +{
> > +	return 0;
> > +}
> > +
> > +#define meminspect_register_pa(...)		do { } while (0)
> > +#define meminspect_register_id_va(...)		do { } while (0)
> > +#define meminspect_register_va(...)		do { } while (0)
> > +#define meminspect_lock_register_pa(...)	do { } while (0)
> > +#define meminspect_lock_register_va(...)	do { } while (0)
> > +#define meminspect_lock_register_id_va(...)	do { } while (0)
> > +#define meminspect_lock_traverse(...)		do { } while (0)
> > +#define meminspect_lock_unregister_va(...)	do { } while (0)
> > +#define meminspect_lock_unregister_pa(...)	do { } while (0)
> > +#define meminspect_lock_unregister_id(...)	do { } while (0)
> > +#endif
> > +
> > +#endif
> > diff --git a/init/Kconfig b/init/Kconfig
> > index fa42fb264c9c..adbe607b7b62 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -2294,6 +2294,7 @@ config TRACEPOINTS
> >  source "kernel/Kconfig.kexec"
> >
> >  source "kernel/liveupdate/Kconfig"
> > +source "kernel/meminspect/Kconfig"
> >
> >  endmenu		# General setup
> >
> > diff --git a/kernel/Makefile b/kernel/Makefile
> > index 1e1a31673577..7c74a4f94a81 100644
> > --- a/kernel/Makefile
> > +++ b/kernel/Makefile
> > @@ -52,6 +52,7 @@ obj-y += locking/
> >  obj-y += power/
> >  obj-y += printk/
> >  obj-y += irq/
> > +obj-y += meminspect/
> >  obj-y += rcu/
> >  obj-y += livepatch/
> >  obj-y += liveupdate/
> > diff --git a/kernel/meminspect/Kconfig b/kernel/meminspect/Kconfig
> > new file mode 100644
> > index 000000000000..18ff511ad4cf
> > --- /dev/null
> > +++ b/kernel/meminspect/Kconfig
> > @@ -0,0 +1,18 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config MEMINSPECT
> > +	bool "Allow the kernel to register memory regions for inspection purpose"
> > +	depends on !CRASH_DUMP || DMA_CMA
> 
> Why does it depend on CONFIG_DMA_CMA?

It uses CMA for contiguous memory to store ELF metadata for all
segments, which will be the very first entry in the table. The
dma_alloc_from_contiguous() and dma_common_contiguous_remap()
APIs are used for this purpose.

> 
> > +	help
> > +	  Inspection mechanism allows registration of a specific memory
> > +	  area (or object) for later inspection purposes. Ranges are added
> > +	  into an inspection table, which can be requested and analyzed by
> > +	  specific drivers. Drivers would interface any hardware mechanism
> > +	  that will allow inspection of the data, including but not limited
> > +	  to: dumping for debugging, creating a coredump, analysis, or
> > +	  statistical information.  The inspection table is created ahead
> > +	  of time such that it can be later used regardless of the state of
> > +	  the kernel (running, frozen, crashed, or any particular state).
> 
> Another wall of text and it's not at all clear what this is suppose to do,
> this needs to be completely reworked.

Ack.

> 
> > +
> > +	  Note that modules using this feature must be rebuilt if this
> > +	  option changes.
> > diff --git a/kernel/meminspect/Makefile b/kernel/meminspect/Makefile
> > new file mode 100644
> > index 000000000000..09fd55e6d9cf
> > --- /dev/null
> > +++ b/kernel/meminspect/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +obj-$(CONFIG_MEMINSPECT) += meminspect.o
> > diff --git a/kernel/meminspect/meminspect.c b/kernel/meminspect/meminspect.c
> > new file mode 100644
> > index 000000000000..d9d38f484f1f
> > --- /dev/null
> > +++ b/kernel/meminspect/meminspect.c
> > @@ -0,0 +1,474 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/crash_core.h>
> > +#include <linux/dma-map-ops.h>
> > +#include <linux/errno.h>
> > +#include <linux/meminspect.h>
> > +#include <linux/notifier.h>
> > +#include <linux/vmcore_info.h>
> > +
> > +static DEFINE_MUTEX(meminspect_lock);
> > +static struct inspect_entry inspect_entries[MEMINSPECT_ID_MAX];
> > +
> > +static ATOMIC_NOTIFIER_HEAD(meminspect_notifier_list);
> > +
> > +#ifdef CONFIG_CRASH_DUMP
> > +
> > +#define CORE_STR "CORE"
> > +
> > +static struct elfhdr *ehdr;
> > +static size_t elf_offset;
> > +static bool elf_hdr_ready;
> > +
> > +static void append_kcore_note(char *notes, size_t *i, const char *name,
> > +			      unsigned int type, const void *desc,
> > +			      size_t descsz)
> > +{
> > +	struct elf_note *note = (struct elf_note *)&notes[*i];
> > +
> > +	note->n_namesz = strlen(name) + 1;
> > +	note->n_descsz = descsz;
> > +	note->n_type = type;
> > +	*i += sizeof(*note);
> > +	memcpy(&notes[*i], name, note->n_namesz);
> > +	*i = ALIGN(*i + note->n_namesz, 4);
> > +	memcpy(&notes[*i], desc, descsz);
> > +	*i = ALIGN(*i + descsz, 4);
> > +}
> > +
> > +static void append_kcore_note_nodesc(char *notes, size_t *i, const char *name,
> > +				     unsigned int type, size_t descsz)
> > +{
> > +	struct elf_note *note = (struct elf_note *)&notes[*i];
> > +
> > +	note->n_namesz = strlen(name) + 1;
> > +	note->n_descsz = descsz;
> > +	note->n_type = type;
> > +	*i += sizeof(*note);
> > +	memcpy(&notes[*i], name, note->n_namesz);
> > +	*i = ALIGN(*i + note->n_namesz, 4);
> > +}
> > +
> > +static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
> > +{
> > +	struct elf_phdr *ephdr = (struct elf_phdr *)((size_t)ehdr + ehdr->e_phoff);
> > +
> > +	return &ephdr[idx];
> > +}
> > +
> > +static int clear_elfheader(const struct inspect_entry *e)
> > +{
> > +	struct elf_phdr *phdr;
> > +	struct elf_phdr *tmp_phdr;
> > +	unsigned int phidx;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ehdr->e_phnum; i++) {
> > +		phdr = elf_phdr_entry_addr(ehdr, i);
> > +		if (phdr->p_paddr == e->pa &&
> > +		    phdr->p_memsz == ALIGN(e->size, 4))
> > +			break;
> > +	}
> > +
> > +	if (i == ehdr->e_phnum) {
> > +		pr_debug("Cannot find program header entry in elf\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	phidx = i;
> > +
> > +	/* Clear program header */
> > +	tmp_phdr = elf_phdr_entry_addr(ehdr, phidx);
> > +	for (i = phidx; i < ehdr->e_phnum - 1; i++) {
> > +		tmp_phdr = elf_phdr_entry_addr(ehdr, i + 1);
> > +		phdr = elf_phdr_entry_addr(ehdr, i);
> > +		memcpy(phdr, tmp_phdr, sizeof(*phdr));
> > +		phdr->p_offset = phdr->p_offset - ALIGN(e->size, 4);
> > +	}
> > +	memset(tmp_phdr, 0, sizeof(*tmp_phdr));
> > +	ehdr->e_phnum--;
> > +
> > +	elf_offset -= ALIGN(e->size, 4);
> > +
> > +	return 0;
> > +}
> > +
> > +static void update_elfheader(const struct inspect_entry *e)
> > +{
> > +	struct elf_phdr *phdr;
> > +
> > +	phdr = elf_phdr_entry_addr(ehdr, ehdr->e_phnum++);
> > +
> > +	phdr->p_type = PT_LOAD;
> > +	phdr->p_offset = elf_offset;
> > +	phdr->p_vaddr = (elf_addr_t)e->va;
> > +	if (e->pa)
> > +		phdr->p_paddr = (elf_addr_t)e->pa;
> > +	else
> > +		phdr->p_paddr = (elf_addr_t)virt_to_phys(e->va);
> > +
> > +	phdr->p_filesz = ALIGN(e->size, 4);
> > +	phdr->p_memsz = ALIGN(e->size, 4);
> > +	phdr->p_flags = PF_R | PF_W;
> > +	elf_offset += ALIGN(e->size, 4);
> > +}
> > +
> > +/*
> > + * This function prepares the elf header for the coredump image.
> > + * Initially there is a single program header for the elf NOTE.
> > + * The note contains the usual core dump information, and the vmcoreinfo.
> > + */
> > +static int init_elfheader(void)
> > +{
> > +	struct elf_phdr *phdr;
> > +	void *notes;
> > +	unsigned int elfh_size, buf_sz;
> > +	unsigned int phdr_off;
> > +	size_t note_len, i = 0;
> > +	struct page *p;
> > +
> > +	struct elf_prstatus prstatus = {};
> > +	struct elf_prpsinfo prpsinfo = {
> > +		.pr_sname = 'R',
> > +		.pr_fname = "vmlinux",
> > +	};
> > +
> > +	/*
> > +	 * Header buffer contains:
> > +	 * ELF header, Note entry with PR status, PR ps info, and vmcoreinfo.
> > +	 * Also, MEMINSPECT_ID_MAX program headers.
> > +	 */
> > +	elfh_size = sizeof(*ehdr);
> > +	elfh_size += sizeof(struct elf_prstatus);
> > +	elfh_size += sizeof(struct elf_prpsinfo);
> > +	elfh_size += sizeof(VMCOREINFO_NOTE_NAME);
> > +	elfh_size += ALIGN(vmcoreinfo_size, 4);
> > +	elfh_size += (sizeof(*phdr)) * (MEMINSPECT_ID_MAX);
> > +
> > +	elfh_size = ALIGN(elfh_size, 4);
> > +
> > +	/* Length of the note is made of :
> > +	 * 3 elf notes structs (prstatus, prpsinfo, vmcoreinfo)
> > +	 * 3 notes names (2 core strings, 1 vmcoreinfo name)
> > +	 * sizeof each note
> > +	 */
> > +	note_len = (3 * sizeof(struct elf_note) +
> > +		    2 * ALIGN(sizeof(CORE_STR), 4) +
> > +		    VMCOREINFO_NOTE_NAME_BYTES +
> > +		    ALIGN(sizeof(struct elf_prstatus), 4) +
> > +		    ALIGN(sizeof(struct elf_prpsinfo), 4) +
> > +		    ALIGN(vmcoreinfo_size, 4));
> > +
> > +	buf_sz = elfh_size + note_len - ALIGN(vmcoreinfo_size, 4);
> > +
> > +	/* Never freed */
> > +	p = dma_alloc_from_contiguous(NULL, buf_sz >> PAGE_SHIFT,
> > +				      get_order(buf_sz), true);
> > +	if (!p)
> > +		return -ENOMEM;
> > +
> > +	ehdr = dma_common_contiguous_remap(p, buf_sz,
> > +					   pgprot_decrypted(pgprot_dmacoherent(PAGE_KERNEL)),
> > +					   __builtin_return_address(0));
> > +	if (!ehdr) {
> > +		dma_release_from_contiguous(NULL, p, buf_sz >> PAGE_SHIFT);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	memset(ehdr, 0, elfh_size);
> > +
> > +	/* Assign Program headers offset, it's right after the elf header. */
> > +	phdr = (struct elf_phdr *)(ehdr + 1);
> > +	phdr_off = sizeof(*ehdr);
> > +
> > +	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
> > +	ehdr->e_ident[EI_CLASS] = ELF_CLASS;
> > +	ehdr->e_ident[EI_DATA] = ELF_DATA;
> > +	ehdr->e_ident[EI_VERSION] = EV_CURRENT;
> > +	ehdr->e_ident[EI_OSABI] = ELF_OSABI;
> > +	ehdr->e_type = ET_CORE;
> > +	ehdr->e_machine = ELF_ARCH;
> > +	ehdr->e_version = EV_CURRENT;
> > +	ehdr->e_ehsize = sizeof(*ehdr);
> > +	ehdr->e_phentsize = sizeof(*phdr);
> > +
> > +	elf_offset = elfh_size;
> > +
> > +	notes = (void *)(((char *)ehdr) + elf_offset);
> > +
> > +	/* we have a single program header now */
> > +	ehdr->e_phnum = 1;
> > +
> > +	phdr->p_type = PT_NOTE;
> > +	phdr->p_offset = elf_offset;
> > +	phdr->p_filesz = note_len;
> > +
> > +	/* advance elf offset */
> > +	elf_offset += note_len;
> > +
> > +	strscpy(prpsinfo.pr_psargs, saved_command_line,
> > +		sizeof(prpsinfo.pr_psargs));
> > +
> > +	append_kcore_note(notes, &i, CORE_STR, NT_PRSTATUS, &prstatus,
> > +			  sizeof(prstatus));
> > +	append_kcore_note(notes, &i, CORE_STR, NT_PRPSINFO, &prpsinfo,
> > +			  sizeof(prpsinfo));
> > +	append_kcore_note_nodesc(notes, &i, VMCOREINFO_NOTE_NAME, 0,
> > +				 ALIGN(vmcoreinfo_size, 4));
> > +
> > +	ehdr->e_phoff = phdr_off;
> > +
> > +	/* This is the first coredump region, the ELF header */
> > +	meminspect_register_id_pa(MEMINSPECT_ID_ELF, page_to_phys(p),
> > +				  buf_sz, MEMINSPECT_TYPE_REGULAR);
> > +
> > +	/*
> > +	 * The second region is the vmcoreinfo, which goes right after.
> > +	 * It's being registered through vmcoreinfo.
> > +	 */
> > +
> > +	return 0;
> > +}
> > +#endif
> 
> Put /* <condition> */ on the end of big #endif blocks please.

Ack.

> 
> > +
> > +/**
> > + * meminspect_unregister_id() - Unregister region from inspection table.
> > + * @id: region's id in the table
> > + *
> > + * Return: None
> > + */
> > +void meminspect_unregister_id(enum meminspect_uid id)
> > +{
> > +	struct inspect_entry *e;
> > +
> > +	WARN_ON(!mutex_is_locked(&meminspect_lock));
> > +
> > +	e = &inspect_entries[id];
> > +	if (!e->id)
> > +		return;
> > +
> > +	atomic_notifier_call_chain(&meminspect_notifier_list,
> > +				   MEMINSPECT_NOTIFIER_REMOVE, e);
> > +#ifdef CONFIG_CRASH_DUMP
> > +	if (elf_hdr_ready)
> > +		clear_elfheader(e);
> > +#endif
> > +	memset(e, 0, sizeof(*e));
> > +}
> > +EXPORT_SYMBOL_GPL(meminspect_unregister_id);
> > +
> > +/**
> > + * meminspect_unregister_pa() - Unregister region from inspection table.
> > + * @pa: Physical address of the memory region to remove
> > + * @size: Size of the memory region to remove
> > + *
> > + * Return: None
> > + */
> > +void meminspect_unregister_pa(phys_addr_t pa, size_t size)
> > +{
> > +	struct inspect_entry *e;
> > +	enum meminspect_uid i;
> > +
> > +	WARN_ON(!mutex_is_locked(&meminspect_lock));
> > +
> > +	for (i = MEMINSPECT_ID_ELF; i < MEMINSPECT_ID_MAX; i++) {
> > +		e = &inspect_entries[i];
> > +		if (e->pa != pa)
> > +			continue;
> > +		if (e->size != size)
> > +			continue;
> > +		meminspect_unregister_id(e->id);
> > +		return;
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(meminspect_unregister_pa);
> > +
> > +/**
> > + * meminspect_register_id_pa() - Register region into inspection table
> > + *		 with given ID and physical address.
> > + * @req_id: Requested unique meminspect_uid that identifies the region
> > + *	This can be MEMINSPECT_ID_DYNAMIC, in which case the function will
> > + *	find an unused ID and register with it.
> > + * @pa: physical address of the memory region
> > + * @size: region size
> > + * @type: region type
> > + *
> > + * Return: None
> > + */
> > +void meminspect_register_id_pa(enum meminspect_uid req_id, phys_addr_t pa,
> > +			       size_t size, unsigned int type)
> > +{
> > +	struct inspect_entry *e;
> > +	enum meminspect_uid uid = req_id;
> > +
> > +	WARN_ON(!mutex_is_locked(&meminspect_lock));
> > +
> > +	if (uid <= MEMINSPECT_ID_NONE || uid >= MEMINSPECT_ID_MAX)
> > +		return;
> > +
> > +	if (uid == MEMINSPECT_ID_DYNAMIC)
> > +		while (uid < MEMINSPECT_ID_MAX) {
> > +			if (!inspect_entries[uid].id)
> > +				break;
> > +			uid++;
> > +		}
> > +
> > +	if (uid == MEMINSPECT_ID_MAX)
> > +		return;
> > +
> > +	e = &inspect_entries[uid];
> > +
> > +	if (e->id)
> > +		meminspect_unregister_id(e->id);
> > +
> > +	e->pa = pa;
> > +	e->va = phys_to_virt(pa);
> > +	e->size = size;
> > +	e->id = uid;
> > +	e->type = type;
> > +#ifdef CONFIG_CRASH_DUMP
> > +	if (elf_hdr_ready)
> > +		update_elfheader(e);
> > +#endif
> > +	atomic_notifier_call_chain(&meminspect_notifier_list,
> > +				   MEMINSPECT_NOTIFIER_ADD, e);
> > +}
> > +EXPORT_SYMBOL_GPL(meminspect_register_id_pa);
> > +
> > +/**
> > + * meminspect_table_lock() - Lock the mutex on the inspection table
> > + *
> > + * Return: None
> > + */
> > +void meminspect_table_lock(void)
> > +{
> > +	mutex_lock(&meminspect_lock);
> > +}
> > +EXPORT_SYMBOL_GPL(meminspect_table_lock);
> > +
> > +/**
> > + * meminspect_table_unlock() - Unlock the mutex on the inspection table
> > + *
> > + * Return: None
> > + */
> > +void meminspect_table_unlock(void)
> > +{
> > +	mutex_unlock(&meminspect_lock);
> > +}
> > +EXPORT_SYMBOL_GPL(meminspect_table_unlock);
> > +
> > +/**
> > + * meminspect_traverse() - Traverse the meminspect table and call the
> > + *		callback function for each valid entry.
> > + * @priv: private data to be passed to the callback
> > + * @cb: meminspect iterator callback that should be called for each entry
> > + *
> > + * Return: None
> > + */
> > +void meminspect_traverse(void *priv, meminspect_iter_cb_t cb)
> > +{
> > +	const struct inspect_entry *e;
> > +	int i;
> > +
> > +	WARN_ON(!mutex_is_locked(&meminspect_lock));
> > +
> > +	for (i = MEMINSPECT_ID_ELF; i < MEMINSPECT_ID_MAX; i++) {
> > +		e = &inspect_entries[i];
> > +		if (e->id)
> > +			cb(priv, e);
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(meminspect_traverse);
> > +
> > +/**
> > + * meminspect_notifier_register() - Register a notifier to meminspect table
> > + * @n: notifier block to register. This will be called whenever an entry
> > + *		is being added or removed.
> > + *
> > + * Return: errno
> > + */
> > +int meminspect_notifier_register(struct notifier_block *n)
> > +{
> > +	return atomic_notifier_chain_register(&meminspect_notifier_list, n);
> > +}
> > +EXPORT_SYMBOL_GPL(meminspect_notifier_register);
> > +
> > +/**
> > + * meminspect_notifier_unregister() - Unregister a previously registered
> > + *		notifier from meminspect table.
> > + * @n: notifier block to unregister.
> > + *
> > + * Return: errno
> > + */
> > +int meminspect_notifier_unregister(struct notifier_block *n)
> > +{
> > +	return atomic_notifier_chain_unregister(&meminspect_notifier_list, n);
> > +}
> > +EXPORT_SYMBOL_GPL(meminspect_notifier_unregister);
> > +
> > +#ifdef CONFIG_CRASH_DUMP
> > +static int __init meminspect_prepare_crashdump(void)
> > +{
> > +	const struct inspect_entry *e;
> > +	int ret;
> > +	enum meminspect_uid i;
> > +
> > +	ret = init_elfheader();
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * Some regions may have been registered very early.
> > +	 * Update the elf header for all existing regions,
> > +	 * except for MEMINSPECT_ID_ELF and MEMINSPECT_ID_VMCOREINFO,
> > +	 * those are included in the ELF header upon its creation.
> > +	 */
> > +	for (i = MEMINSPECT_ID_VMCOREINFO + 1; i < MEMINSPECT_ID_MAX; i++) {
> > +		e = &inspect_entries[i];
> > +		if (e->id)
> > +			update_elfheader(e);
> > +	}
> > +
> > +	elf_hdr_ready = true;
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> > +static int __init meminspect_prepare_table(void)
> > +{
> > +	const struct inspect_entry *e;
> > +	enum meminspect_uid i;
> > +	int ret;
> > +
> > +	meminspect_table_lock();
> > +	/*
> > +	 * First, copy all entries from the compiler built table
> > +	 * In case some entries are registered multiple times,
> > +	 * the last chronological entry will be stored.
> > +	 * Previously registered entries will be dropped.
> > +	 */
> > +	for_each_meminspect_entry(e) {
> > +		inspect_entries[e->id] = *e;
> > +		if (!inspect_entries[e->id].pa && inspect_entries[e->id].va)
> > +			inspect_entries[e->id].pa = virt_to_phys(inspect_entries[e->id].va);
> > +	}
> > +#ifdef CONFIG_CRASH_DUMP
> > +	ret = meminspect_prepare_crashdump();
> > +	if (ret)
> > +		pr_warn("meminspect: failed to prepare crashdump ELF header: %d\n", ret);
> > +#endif
> > +	/* if we have early notifiers registered, call them now */
> > +	for (i = MEMINSPECT_ID_ELF; i < MEMINSPECT_ID_MAX; i++)
> > +		if (inspect_entries[i].id)
> > +			atomic_notifier_call_chain(&meminspect_notifier_list,
> > +						   MEMINSPECT_NOTIFIER_ADD,
> > +						   &inspect_entries[i]);
> > +	meminspect_table_unlock();
> > +
> > +	pr_debug("Memory inspection table initialized\n");
> > +
> > +	return 0;
> > +}
> > +late_initcall(meminspect_prepare_table);
> >
> > --
> > 2.53.0
> >
> 
> Thanks, Lorenzo

-- 
-Mukesh Ojha

