Return-Path: <linux-arm-msm+bounces-98643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BWXEJKYu2nwlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:32:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D528C2C6D01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 786D1316BA65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79E0351C0A;
	Thu, 19 Mar 2026 06:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkZp3sUq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GG9n/3Hb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EFD34E743
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901923; cv=none; b=sGKtLS8zOLO/ZgfiDFs0H4n+wmaFERdfdzJv64ZYjFIHurWL+xhL4790KH7WcAeLAIOeZ6SlnwFDL3/vEdMDQAXj4Qym2JeFkelDZzrbEGxZyBsLu+Jc7LxAGKLB0oM55oGuLFLjIyXXzXxftlfjZWmfbv2IoMNi2NIIlzj04c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901923; c=relaxed/simple;
	bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oxg+yf89Mk7mCtFlLsDzhEDw2WxPpmX6HNUeQVtrQPEgFZAfxVBUTFpG+ZmcdXFJ+9Baqn2rITT67YNuLxyJO46KWPVyEWS4qy1KGdXe4QV6FqUNdxhBM99/OplGdU0UPtFfj1lCxVYflLuhya3ezplTodhpLACw1pSWjaI6mQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkZp3sUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GG9n/3Hb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xmkw2469978
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=fkZp3sUqKr59AwKU
	3uQq48p13b4vR6gBonGwvBmVjwn5n/YYbgRKQGX/vBwXiktFUhq81HbCwNCW7GQx
	AdJs03ZGTM2ggM9Ddue2sEYze0QrekcBpIPDuNn7Ltkon6+8QlbiKXCY6n1yinIk
	7Q/ecDZD66cnqUXbXDBqF2m83V4D9ky0+88t9zU4Zx66m1bl/YWl7wQMlgRyhDjA
	FrnWi+RtiXSskMjCJU8GZbxZRXIz/m/QouIEaYH4gHB2p7aIax9sfstropJL1srf
	i3/C0sB0dbhVo+s6P9F0xG9R3rMmVg6qeZgTKbfAyH6a10Tm31j/HtI990NGnQy4
	+/BQNw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj53mrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0565d77a6so9768565ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901920; x=1774506720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=GG9n/3HbU+/9x0AEEUlPb/GyN94eeDjCOwtsToX1UML203CBde4VwyEwIqljF9veIT
         dUjUkqcoKHAeCNfTJUrfjaEDq3BmTsraWJw3gd4OmrRVPjO1dtDhyNzj+rIQLvg2Y4T3
         VfJWdP7ZgDDTFtpZrPTBIX1kIaQ586UYep1OPtOw7NxVu4Ylrv6iPJr7KuD3CPLIoERs
         apLFUcX9uf0rmQkMbHzsswWTDNG6pugiL6QJU73OVD0W52kuJaVxCh4SFEbkyyUyPUVV
         0W5T8tkP617NdA6vwun4vNEQLNa/QdgXXQsoto/kh9Jrju0bS4O+6LmllBecf3aTGcGr
         vP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901920; x=1774506720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=b0E3I0a4UHYiky9MNFnMaWkUTHxq0IueS/oN6TmFXlQP2Gf1b+YCWL+Tw3MhHflY7m
         SxKnJiXVwIAVjkt+etyiPfftd7Bl18esmfLArV22fNizx6nPegSGqSPTET4OWobwcYxt
         10vV+wcw9mIjymd5QIVWabBJZKM/WPOr+Nx76nYLGmw3JAicXC25+mBtBoX8bDFEkPkb
         eGlPvqCfPm4a1vHO2bU75YaXrq01FbbSWd+eKNSBA0qpZPtyYEp+gVZ8p2D/VvZ6VKmT
         /lOFW5Zz7Tk3MwnEGHFKcrClD6z3i2is/H2zYIfm3e5ZalrNMpAgOoDnTeOE94JOBSJs
         dtKA==
X-Forwarded-Encrypted: i=1; AJvYcCU5l+nCv8K+WCbCdYAtCiBCVrsMMQdJp3q/MWDvtwEf7eXJK0bKMV7rwAAfpV7vH/YK+AwB5RFdIOGmtoFa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5SMSUsNUYa+A9a+R56pzGTy/riGPUiXxMZuBvIVc1jvo4QhUf
	Nt1k8ranMo2SK8EvSBiN2sCEy7+zsHIGfl/Al5NriezNbUFJjekb/H4cz1EnbjVyX5FWzdiOSv8
	OeBIuIwkirIZyQvEjiCf6QF0WhJbbVGN9RC/mi4Pk70f7aru9gSAz6SE3zvgPVwFyFXea
X-Gm-Gg: ATEYQzyc8b561rDWfSb0MqPM2ezsuBLf4NKd1m2JZ/EIKKKMaTGbubSJYXIN+KsSsWY
	WKRqDY/AEowSitvLs62aAioT0d2ng52udBT5+JBwDxbUzNt6BcSNxLAOewRtoGH74OF8+pRvsLX
	p1HWpLAM+GR9EdO6z2wgW+hKS1gvu14XJ3bxlq/oIjAgUkkKWkd+mhJTtq3MMHLC6DPfqLBglCc
	pHA7eJqaDJAEuUzt9iTURYXpNf+tlcZeBt1mHNMDjUtII33dtbvvw8UhMMTHmgChQBfxUdno+Z8
	43yPkGyJN7TiOeHCPnqQblUJN3CxvVhptj/ZgFJKDma5XH/rSncD6F1NiLrMYenpcGp/bNI2q1Z
	5N75ri/w/bDPyexOZCqF+R3QM9moMD6bbD6TH5UlPMpXADIOKF2Q=
X-Received: by 2002:a17:903:3810:b0:2ae:a429:fc42 with SMTP id d9443c01a7336-2b06e400620mr66595385ad.40.1773901920345;
        Wed, 18 Mar 2026 23:32:00 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2ae:a429:fc42 with SMTP id d9443c01a7336-2b06e400620mr66594985ad.40.1773901919866;
        Wed, 18 Mar 2026 23:31:59 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:31:59 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:43 +0530
Subject: [PATCH v4 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=e9fMzcaKKjCxCsbrxlVdE5UJdojNscTn2zbL9SlQlbqh9xy1a1pnb+eD2q55B5TwUBYiq1GVm
 7P07BMMwHXWBaY4PRv2kbaKxxJwiZycQYlSC1IZL7WAdxVcWpfcgiJ/
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfXw0mhsvhuAkTk
 58lFLSjxVPBwL+hXsPKtW1NQ3BISHZBMvBRokTWF+3VNZUNXnjFNk5VJ0h0Gp1vh3w+czx3H9z4
 ziH7rKG64JBUsbDHQH4oIRotoMYbfXXKmRm3fgac1ZIF6blkDUYKbCncDUaksixEvO6hXtQ0haB
 5npiG6lt5agsUfgYRTzieFgCeFpnQvyW3+jrAhIkjQrf/VO2btsdqOuBx3LD5etuZIRSeDM9HFK
 YKa72x9bukmHc9EWMtHxEQijmn+Uhvq53q6u3+wmM+JYOQL1J+Cl6f3B2FVFI3KjYKRZ9D9XuDX
 2ZNGZkPKN/d5gTLZUFGp4D7vCJHLdqhvE8ZIarwktAhpPbBvEPeoRp19IZx43PpQFX03bOOjP9S
 aeN3GoIXDWrmbYS/VBdfIefTvIbxb9A/ycMZyKMyq+rTqKtMrr5DMMlTNQvjqgXLhYQU44x38Xz
 DBg4E4YrI0UGwQbvlFg==
X-Proofpoint-ORIG-GUID: Mcwz2Z5KJ3z7zP8OHSBOVAlLgtejw2F8
X-Proofpoint-GUID: Mcwz2Z5KJ3z7zP8OHSBOVAlLgtejw2F8
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bb9861 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98643-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D528C2C6D01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
channel rather than a QAIC specific channel name. As a result, the sahara
driver does not currently bind to such devices and never probes.

Extend the MHI device ID match table to also match the SAHARA channel
name. This allows the Sahara protocol driver to bind to devices that
expose the protocol directly on a standard sahara MHI channel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,

-- 
2.34.1


