Return-Path: <linux-arm-msm+bounces-117037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mWIfLCEZTGpygQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:07:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C606715A18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:07:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AbccwYny;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iY7BUsO6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117037-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117037-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82D683049F6C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0C63A83A8;
	Mon,  6 Jul 2026 21:06:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D358B3BB682
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:06:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371966; cv=none; b=H2L5rMqtnqfSTJpPsISDWkKqnX43ewUykeAxMgb3LvLqD/O6GC8a+JktvAkiPuKioSffEmCMy1OsU+fHtGupXJVf3VBZuMfiobiE1F0sV4qkM2VVz6P4fz/eT9v92h/7CghBcDhOzdftvqgMuo4/4V86f89nU+MY1k02Y+KL3A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371966; c=relaxed/simple;
	bh=I0NgFN3rF+KkU4yqBh/hyP5wG9C/1rf8uLv6/y4DOzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0kNUlvVzVIUT1IKgr1xJ+OPSRq5B40a/qOfyILby1W2NFJJqFc+NceSw9MPUdxv4RWhmv1IoqsfkLkYIYRnWbSNJS4IXryTRXZ7EhbVmSIgdnzNavOtYwkgOzpOZnSBoMLdEfpt8UEguYLekiZ9oQ7RwhpEuPYtMjq7rET/5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbccwYny; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iY7BUsO6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE6DQ1626349
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=; b=AbccwYnywChyPTgF
	RBrC4+h2W36mvrkx3GLid2XD8jzQPcYsCBVJGtpVUJgTXhdJutcHjTzD+D4t3OmW
	lAYD/YbakPxt2eAcAAgatuogf9tjrG0N3iZnhxmtMXA+tqUfaMGgFLTSup/4a7uv
	Ai9+L9f6UpPHNpTh5q4IE4Pf/vvUYu1QZathG5DaDd80P7UTdzhStjUgkoSyK+lQ
	WulOaq6W7+4URzgUeBfR5sepN6WbPw4AVMZYzUHzxtrLvY43BLm6GhQXeLDN7FFH
	SFsdkd+9rhUtY/gn6R1ofBxxyGg3sYXhf8F+1gFjx9+PAI1fjgUsEukv3e4jEKij
	JNNF/Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9bbtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:06:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso5556493a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371963; x=1783976763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=iY7BUsO6WaAIkhbboFO7NvYssXBKOC04g0jrL6XVl5ZAzO3Urcpc4fFcNYV9s7g1bp
         qaClmw026bUq++t16iyxw+r9M+zii+GAeDM1T5yUzyGMzhJR1dauLFu09+8JpfWyIO7C
         IBthJe+DOCA12UncRgoYi97jBKZVFSd26hBs822Yok5sHbWemM7wcBmo1nII+hbmxs3y
         0Rb8KZ18Ih8fxNLU5lMb7resPoNMyErHN3uRioob1u76aVFkQd+PmXhGQZxdb0ENpdGn
         xQXSbop2dYASIwXoEyLmWKLYj6bJe5R+YtRjxiMI5MYOvkafkBXaUY50oMRVDVroyGuJ
         7WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371963; x=1783976763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L1sQOlc7W2R+Nl5G9nVFB2M5cH4AGDkF0NzQkvcFvZA=;
        b=Vy2hhFzMV3TlqCuSMIVpjVw0G2BTPzbFRflt/mUtZINIZ4gDbfKfxjkH7q+NzHleSc
         2S2cIiHb9F/7oiZIe9whwzQhWh1m+LlRX7wwXos9fUix1bIXYjWxFKIwTGg45sKkEuAN
         lP8udM8nAnT2vAmnz0xpWKU71TFZQ/4ujd15l55XY1vC+HeAewTvVy2+jGvyZewT7znM
         OBE9/EDxa8w6TaS+kfjvV+BiyZfzhjv7f3XOump370MlPbLpYkZaztbH9v9kSVvu+w3d
         fXMM2GEGUP0/fTL/Osk0iXMEA4nkAVJu5P1OqYX+ubChGBFOtEfpKx8hXlJPk5O3E3QH
         Kziw==
X-Forwarded-Encrypted: i=1; AHgh+RrsdlLkUgNU2HhUlSd6Fnalw2tGd1o3DUoh7JaoZFvK2jcmO3/q6NovolClACckfG02L+8bpeJDOL+ASfC2@vger.kernel.org
X-Gm-Message-State: AOJu0YwfO1Pbe5hDy+sC9bVFBM08wyXVFiKH1Su6vR/kSXnApF6A+eEu
	GHAjCyB1YvIcnJjH4pg9nvuogiGjEw4GoEv2uFK2Mq9AHg9VZcsDyyraKIKBhEk9i5n0DjPDVsL
	UPTm2RXH53LaWTFNKRmxOYn6CrKSIoFlzIXatlc4ZkqH5FY4GDYc+iw6OGr5D1y0cDLlz
X-Gm-Gg: AfdE7cnAcYUm2h8c126qqtJtDpqwWJtEhDGzuIr9bpI1RO0gRP7cciJAFRCRnIY8DFR
	OJNfV2r3UJ0XmGv7ZGvYr23Iu7DoQjRa8qgg4FafAk/YOvoup2gpK4/PFe/rPExBW9XaWIMh3i4
	RLd2jG+i5EovYt/7MnRbRXYtDeON7KIOVe+qGTyVK7U+FJfxAD/8uERGmaVwG8hJgyQEhiuGMM8
	JTOwUcoUhqbItA7CFvcgCxX0nNgYd1FiQ3hIXPoaV4JKs4UmSV+QposZHm4iL6vjokSA7GtEbhb
	k2MGAexr5hI9+Is88AMwK8b6/YPC2MYqxZPTwlfgP5oIOK1v0ErkiGnWkc8Ytww9cVqCHU70fHz
	pmj7CUYTnQ1LFiGz7HRiaZoc6T+YAwP89k0U=
X-Received: by 2002:a05:6a20:be8f:b0:3bf:9615:12da with SMTP id adf61e73a8af0-3c08ede1ea1mr2865644637.23.1783371962620;
        Mon, 06 Jul 2026 14:06:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:be8f:b0:3bf:9615:12da with SMTP id adf61e73a8af0-3c08ede1ea1mr2865583637.23.1783371961997;
        Mon, 06 Jul 2026 14:06:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:06:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:39 +0530
Subject: [PATCH v5 7/7] arm64: dts: qcom: shikra-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-7-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=849;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TpvtLBwihWHNEKd1VwQvgAfHhzoeB2GGOqDfiPe0Xho=;
 b=dfyRRLzk6X22LRvVuarzLJYhr4uXZga/lIRc5OYOiiD8py29ZoBlA877+GkX+z7ssquDayLoS
 i736/Elf9UxAHI+/pIfeTDFCmYSKvza3YQP347A19hJlyWFrrg1G205
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: S6sioioidY8CfnrBVw0YdKgCsMI0brnj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX1scHxlQZ1kaY
 tD4dgFbM+Ve/c3blYvsIpLPkXprigc1EuqnkGhsAGUuKi6tV4Uzz/bVN+mG5JeMr8qfQ2sKVReM
 5FNYExUcMyRsUKb8qmRwLnTijYeF+J4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfXyAyRf6vCr81r
 GmB6k9cSZw2ER480m0bfkZF7nRZedPORcPhArU5WinKdoLgZBU52NLvfiQnRvfNUStuHNLxxcrD
 DAttPG2laO7Ldk7DhUA5Ke9E/S1Jw9FP7cJPwH2+F72LobdMePQr/cM6VIXVN37w3lrhr4Do9TO
 Q5YH74KthnDpYJqh2nyZZ8rr8cDwL2npxgP3SJu9oje7ClRHaWjpwxNza1rXhcwMCY2V+/dIIKi
 doU2gVw9PHrSybepFYWVnc6vcjfRmb+vUfr7Zm1y5xga12bYV8nlZrQYb5cXJV1SK180D7/H7ad
 EamdDwPsK2DAer5jz3MKI1Rw9gRaCrVCNnQUh+wM1pmn2A8K7WyQy1WDSGgbHXhou186IFZnFuR
 Rbwf6/dc58plZjAlQTM8x90R3Hil0yq6dqmcLONgdESMY/72TcTTho3Z/tmZfCm28wnpPu2D3nS
 0fTZp+8AdGmJ+7Qxteg==
X-Proofpoint-GUID: S6sioioidY8CfnrBVw0YdKgCsMI0brnj
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c18bb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117037-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C606715A18

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra EVK boards.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 4b7be09eb5a5..9febbf200f10 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -36,6 +36,14 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.54.0


