Return-Path: <linux-arm-msm+bounces-101470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJYgGQklzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:12:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D832A385B10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAD03303D702
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D40E3AE182;
	Thu,  2 Apr 2026 08:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2+HEmJ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkPkdTXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36FD3A3E77
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117510; cv=none; b=iUzSMUgKgMC0RfijnkfioWY86H7nV6fLx1OJHbNLMeRXK0nzz1YJrc9OgfjNuIS4YZL0sR1EDGovhWOAtTMTgkWE93ID79ews/NK8G5QlksC9z04moV0zHAVMjuxTAF/KewLQvKGrHmHoQKTDZKWNmMyRFI//JJIFQ4Z82UacUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117510; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOfJQ8B1U7/EXVGMSp/ySNbSRDuSCLoR1f61S6f7ZlramfVfSavoh8dLgRleO1eqPbetdzYUOpOAV4nzyc7+THi56rJEmO/gN66e9Jke6tPlCGK8j5PqRY+SmUOjaNWcIELeFDXkIT18ZfLyXIscbGI9aFPKXstQ+WcH0b3BWMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2+HEmJ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkPkdTXs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325VeHx091382
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=S2+HEmJ3crj0wV11XDg2YgQvH18
	a02FPNaTVFkTDaGhtLm4FWUPs3Nbt7ANG7Hkh1PJDZF5AoK4AcDPQinGI7LYvZOh
	Cw/SytMcQZtiaYuTxanDCGCaibH69gLTwZOO0rNCjwOiKiHi8UucFWOMAXhkcMm5
	Bsy28+ZhrIjSXb1hyDG7uZdmZlaZAjCV2B8PvzRMNzjTL6t49fBttl2svAOTCLVW
	edkJBYXnz94tJeD0lI//5WF77q+5i/a/dmeHKA1LC/suuO4a/1ATBoYcyKWdm8SF
	o5ppAWx5uuYaWrFmw7koQ+RxeRMJKv8XCXhaTtJuJpD8Ttm3JN7hWwpwHbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu8neh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfc575fa15so205849585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117493; x=1775722293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=SkPkdTXsRsBIsiUJn74uHNoSYimewlGu1IFheNZgq3SBDXK3nvXVijHDUlvnL+O2mv
         ZphzAGpVlv6Tjun3k49MPq5skQVK1OOjtUbqL9U2eaxWfuj3Hq4wjWpm10w5X+/ATAaa
         rsUN2G6HFCx8E4QeOBk6d36FiDM2buSTH98I9Y5b8VcPDyNTCgsokWIJHa9wUTRm181L
         Q7ohXy/bkZbXplBKZHzkPiOqDhcXde20Zevnuv4fxwmcZ6trRNS8wpsSqRdsRY2Sczi3
         EMvaHaDxsBoNZfsXEGAif7i3EZgAHq+DEcrWeypfRmb1EYvK6NrdQTzUqbFSFLpqcSvN
         ex1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117493; x=1775722293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=HXp1QYc9u9SSb8770kZ3eTFh/lOsv3vgYBBjXNMnN/ly+VlYBgI7NfFMLN1Xo/kE7R
         j2SccLyPqU/BxyRFRM6HFMFNhVM/s2CqrhOUUKEo/5jBEDB2U7vE82Jl1V0YOwsnO2iv
         nftJz4LBD577T+Qq3X4RLNlAaCsLh0vOpUOVTAFGBOYrvD4IQl5uRrTZ34VfiXGVHBjV
         +rl+eTQkIme8/HtNq6sAQ5/SuzrQtQLH+wtNn+SDDe3dGUQd1gvb7luDXP/F/oDT2m+f
         +J9fsWaaaYIgDzpjg5PtmEdptvit8MJSFjrEYUkSZw8VB7k4VxQTJISLt8hmQ6yiGa/s
         k91Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkOIyHsEHeplAfVPOKL1UYJvqDQkUtV5M4GW+LEyePr3qlJaDz5UMURWv2L66AaYM3ZegyROFKAEBaQkpt@vger.kernel.org
X-Gm-Message-State: AOJu0YxEIHnQk8QRyLsnZq95MVSbXGx5+mDV1+Ry3NSdUWx8qQxuTkRr
	FS5B3qFZBMwM/up5N2mF6snOou+3qMtyllIiKuPmBhlmgh7VLeL4P7od2JdWylixIOJAca7ZfAV
	xTECHhLhYkL0w3x89NTSbwAeeIIPcn4asChVpltxMis3sUSmiTdZ3rRW+VYnHcHC3Qe4+
X-Gm-Gg: ATEYQzxOaMP0qMZeb9YPej72wlrS3s3+2qkKP4fzujmfa2TVukdPb3BY3mreq9T79Hr
	G//7ZliDQhFi//TvF5UNPd+zM7qRPfYavi+XvA4rkW+BGLdl0rZfDx9tvT8vygw8hMtMWUXjZHG
	82j/kGrX8Df0X85I/0hTYZAOWDze7xWLBoxsmAbUa0WG30xPvL0yuZGRuMHtYcTbBqcebqaNjoW
	s4QqfHvgU79slXLhSROpfSQWU5UTZHCgeLzUTPvz6Gfy9PnRmCy7itcmu4thfpJv2QS5huhvglh
	taXCtGmHCOsWScH5bA1QlLPgT5pdy/aw2VmyuSt1jHISvXWFEhTXZVStc/YUVkiZmv79MQ4JIRs
	YvPB5qhC034Qj8DoKYtVMkaYIGHEo1WnK7tyXlp4nuS2q+2+yVdZu8Is=
X-Received: by 2002:a05:620a:44cc:b0:8cf:d804:4569 with SMTP id af79cd13be357-8d1b5af1029mr968083785a.23.1775117492937;
        Thu, 02 Apr 2026 01:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:44cc:b0:8cf:d804:4569 with SMTP id af79cd13be357-8d1b5af1029mr968082085a.23.1775117492486;
        Thu, 02 Apr 2026 01:11:32 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v9 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Thu,  2 Apr 2026 08:11:08 +0000
Message-ID: <20260402081118.348071-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX2f+wyPcHDUlp
 BJ38bw64qn6K0bser7jagfsv4rKR4R48A3ivXA8kHBJn0hsZk4adV0RX7dRUJx0x1B8p4068SIV
 KcojBZE+ubo/Bcfjamq56ArWXh93x/crKQ9bts6A60ORZL0NC4wHZdQ1BjuGqNP2x5Pj7RVk9JK
 cx0DXVYicocFz0HXqZ6Q4Wphqvk/gcRsp8xX9MwOyvW8umDRSzouQJWy5de5/c+k30KIRjU8mrV
 nH2+7SExyaLHNnww3ET/jDKRQAKt1ODW10bn60JfKnsXXNZo0UMi+dIIlOTODa+QngtXU6xsuYS
 IedjY7MNtNEJrkvKvd6GwObOc3x86ma8oqOTyxBTVpDaNh042t/dUS53TC77KHIh9/9lhAEiguH
 P2FY9yH4MTdSxvJ6UBJR+a7HSqF5NevrDV+Qbnc3/O42HHxbEpkcmn2NzsbUx6g1JgO1S4v2ydg
 tOEVPwpVPlw/p2ylDEw==
X-Proofpoint-GUID: yOA7vPYqPVNz9g2ty09ft5IlPBrb6YWO
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce24b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: yOA7vPYqPVNz9g2ty09ft5IlPBrb6YWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101470-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D832A385B10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3


