Return-Path: <linux-arm-msm+bounces-96770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK7xIUN9sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:21:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFC42579E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A0D83001FE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D403E9597;
	Tue, 10 Mar 2026 20:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiNYG6Mg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d5blhJAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020063E8699
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174079; cv=none; b=gtbNXau7B0tLi3imEX2gZ0ZFdG6QBLC73H10Df6VJVt2iXNPxDxB6CL7lVixnP+oygkDDNknAztH0zWMwu5cJ5uqZUqy44DvqPZExO6LFpU+wlCx0rt/1P9ws8vSQJ6rbGVa325rhmOmmhXE62dGmL1yv9mAazv1ju538NRRz6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174079; c=relaxed/simple;
	bh=DoL9F6Yy+rSvMBQNw/eS/qA8539X5KoND3cxVd5dx4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rw0GJykgmJifhqfyIec8h3c73nr+LbeQ2fXHhRXN1nWCtfR0DdUTlAx5oMVG0dUOYrL4jP3BTvw2VTpIp8wZ+2bFA8juyUVndmnQY9Z55swDX388gSX25lcUvmIF+7BLNwv+WmPAj5zQfPRypgy4XuAfjAIc/Fp+3nDreCL8P0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiNYG6Mg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d5blhJAc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHD6G91573310
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pr45VIQTBIoBLlkPvMxS8V0csqqIhMCo/oCsn7JOcGU=; b=MiNYG6Mg57sq7QtU
	zJFIBnJyAS7vLog4JGVLNREvSwVC4yWzJRTVbt3IFdvKGvBjgVI97JsNiktdyeVj
	xXLfiKSQwfvXK5tsCPovUzt0e2vzyDn5vMwoDlFnQpzwd2CKrWaOmiWjrdFPeM0S
	DfqByTbpLqi4ehvVsfjsxeOhe5WkbDiZNTHQqVx/6h3Oz7F/Mtynfdha4Zcul4xg
	v0uHkmin0ZLQW7DenGiDyaWWfv35rxEZlufO0XX62XkpWC8yTSU3u7cGrHxV0wt1
	3hyTqzoGEoJLpnQoDlC/yiGAsBwrWRXROCs2QfukllG0dArhrV8lWb/nZRQNMSyk
	5qmNdw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk8p5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:21:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82984468f85so3332238b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174076; x=1773778876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr45VIQTBIoBLlkPvMxS8V0csqqIhMCo/oCsn7JOcGU=;
        b=d5blhJAcOmUP/IU2NfVUVMtxZPRSugmj83M4KEKTIkFeAYYmCIBvM1u3MNDtlsAj30
         mtGRPf4xwz+fLlFvppVo81nIP8eh4UHH8egbmGHfzAuorJNMmr+VC66KCsjnRwa/1WJw
         e2BTtWJyumT9V8k6KV/FoI1ySekc3UB6tp4j3hzy2JVDX16RXxanVLrxY9Lyz+c9NZK6
         0v4fNQfcEnJ2MPW97Rz10b9OyEFFVyU3EYNS7bCDVofAdRTuLQlYVMTRSTJS6fhTN/SR
         KPmwxhUakcqM1Utx4+XVocNcEzrJIO4WqklAsBZPH44wgeBoyBQsKXugmqcHEeK1GZWL
         /dBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174076; x=1773778876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pr45VIQTBIoBLlkPvMxS8V0csqqIhMCo/oCsn7JOcGU=;
        b=qZqfPPCs8YCgM+lL2GlTNywDDfwsrZenssqU+CU1uTlYARm6ykinAQT77zGmVFaZHp
         lbulWzcODsmbNEa6R86n2/0+3tX8FUvOUw0N9GddP2AAigOiULwZFNFGnyESYB9LLzcP
         p/eNbBKoK2/nayw5keUyHN/a8ItPBqdF+rgEfZuHKk7IZ4F3B2RK5k8pfFuN8VrIGSt/
         +oGqlgvlssGufwSAqlmn7Cd7dGlVFNiyJGQKLDyEBZIrYFFJuuPKW5nMaqRJ9EVzDU/5
         UnKk9s2M608EVVEPuQygVDY5Hz9S8hhcXRcq+DmoMkSq7zaEH9ul48qd0wTKOLR1HM5u
         J/cg==
X-Forwarded-Encrypted: i=1; AJvYcCVBz90iN8Qf8A2fxxXcOsmtRZmTfwzLoj4cEJJeCXHEwq47FTgjYUvBzoIBh5SbURy+xERTUwovVkQghLWx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4gFLGaJVXx0oK/T9jmrdF0PpzJXUIMYhVQIm9KYGBg2iqyAdj
	Px70PWqW8Dln8f2hFpltojNU670DNqsWsxE6st5MSRh/0JZssli2RsrE+3KS8shaOV45ZXn3nF8
	YnjrNPddwSPjYx4uLiLz6Po3Kk3nXEoM6+YKjiwrT3EcLN7qfL8YhFsPaoYBei8GAjpCq
X-Gm-Gg: ATEYQzyOLAJuEOQohYS/rSA2jhmpv10YUgO4Pba08Fu7+n0C7Zbm8SFn7tzqOgZeXmD
	SN7hIS71TsGoE75+kQxiCiwhn7qeUo9Q/TBGnHksU47wKBwEvq/HmlsNFySsKXYFRbHKPn51T/z
	5Vs/dq8NZhwqRhz1k8jzhhDK+Gu9jVMhvjMHoepck+J50zwCe2l9P94EWcjNy2SYw5Sklkhy3vi
	Wo2sYH+HHsPIguN+b8AVK82r7D6o2Lydn3t+A/j2Aw3N5WNFsDRnsYwZ6dqHp5yU+hGLIvJctzE
	jGdZjqTJBDEYMEEQdCSNXQVj/F45j7SqvaMs6Bm705r31uW9hGs+KJ2WW7BIqyACQe3FHTcVSeU
	GRH4iBIfWLeJIWVfpo2ZckozBV/0wQjZ/E0DdS3xBx9ahz0ry
X-Received: by 2002:a05:6a00:194f:b0:829:737e:7d77 with SMTP id d2e1a72fcca58-829f7276aa8mr117544b3a.66.1773174075897;
        Tue, 10 Mar 2026 13:21:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:194f:b0:829:737e:7d77 with SMTP id d2e1a72fcca58-829f7276aa8mr117489b3a.66.1773174075251;
        Tue, 10 Mar 2026 13:21:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:21:14 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:04 +0530
Subject: [PATCH v2 20/25] printk: Register information into meminspect
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-20-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=2132;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=DoL9F6Yy+rSvMBQNw/eS/qA8539X5KoND3cxVd5dx4g=;
 b=j+JQFKmaZDxUEpGVy3yxwRluoEiiKKxHpWd1mF6xVlnJWzgrkvwAQJ3AycXjiujTAa6qBPTc/
 fk1Ilv1rpSuD1QonOn1v1fM73CSGktc+aR8CTEikL2TUDUjPNLboP1S
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: bz40DHyw39h_KwVARAOIS_yuHE-BkMVG
X-Proofpoint-ORIG-GUID: bz40DHyw39h_KwVARAOIS_yuHE-BkMVG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX1DUDZ/lPCFHb
 xtr4Q5229tb66cpGPrJquueP8s3yiirk2bxZ9Kf4Ny5ckfNTBhusLCuXk+3RvGzc9D4RK181eaR
 //auEuKY1VAaxMCOC9J31xXAmLkh+xdxaAtELppwZZJ8hAkHUX34abtaGLJ2HwqcnT7y82258X6
 k88EI2LSvJxg0TGtFNCNSfJFhqP1rTE0cFu2qvupENyFwDo+eG7efKlLlYUP9zfFVSGXT5Ki2QL
 WI66Emca7FHbT6AJ3zhndDYIyYyck7Qo8QIwVYI3kIcv/wAAhrUN7HISoQfDLXVLcnFbV2Rsc5k
 9dZViy0rh9jnVHzOCyxwr5S+6qFGO1KjYXxber6EVrbtJ3nTqKSP2Rccby0GvXBfJN92z4Cd4V6
 CwT0dbIXmep7735ju8Cz4Nvx4lwkHEe5ch5nHVc4tezEHH6fvrn9AfhBEVfc4YaquuZHdI2uSfL
 fYjohs9LChypQHXCMow==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b07d3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=iox4zFpeAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZWDwVrzm9O4pBL7d_cQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177
X-Rspamd-Queue-Id: 2BFC42579E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96770-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,suse.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[57];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Annotate vital static, dynamic information into meminspect for debugging

Static:
 - prb_descs
 - prb_infos
 - prb
 - prb_data
 - printk_rb_static
 - printk_rb_dynamic

Dynamic:
 - new_descs
 - new_infos
 - new_log_buf

meminspect uses a different API to annotate variables for inspection,
and information about these variables is stored in the inspection table.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/printk/printk.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0323149548f6..03216e7ef807 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -49,6 +49,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/panic.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -518,10 +519,16 @@ static u32 log_buf_len = __LOG_BUF_LEN;
 #endif
 _DEFINE_PRINTKRB(printk_rb_static, CONFIG_LOG_BUF_SHIFT - PRB_AVGBITS,
 		 PRB_AVGBITS, &__log_buf[0]);
+MEMINSPECT_NAMED_ENTRY(prb_descs, _printk_rb_static_descs);
+MEMINSPECT_NAMED_ENTRY(prb_infos, _printk_rb_static_infos);
+MEMINSPECT_NAMED_ENTRY(prb_data, __log_buf);
+MEMINSPECT_SIMPLE_ENTRY(printk_rb_static);
 
 static struct printk_ringbuffer printk_rb_dynamic;
+MEMINSPECT_SIMPLE_ENTRY(printk_rb_dynamic);
 
 struct printk_ringbuffer *prb = &printk_rb_static;
+MEMINSPECT_SIMPLE_ENTRY(prb);
 
 /*
  * We cannot access per-CPU data (e.g. per-CPU flush irq_work) before
@@ -1238,6 +1245,10 @@ void __init setup_log_buf(int early)
 
 	local_irq_restore(flags);
 
+	meminspect_register_va(new_log_buf, new_log_buf_len);
+	meminspect_register_va(new_descs, new_descs_size);
+	meminspect_register_va(new_infos, new_infos_size);
+
 	/*
 	 * Copy any remaining messages that might have appeared from
 	 * NMI context after copying but before switching to the

-- 
2.50.1


