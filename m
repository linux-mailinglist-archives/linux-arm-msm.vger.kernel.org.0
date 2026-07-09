Return-Path: <linux-arm-msm+bounces-118026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TXeHEm+nT2o/lwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:51:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D35C731CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:51:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FWxBYymy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S6grsNXF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118026-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118026-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 068DF3057324
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA4836D4E1;
	Thu,  9 Jul 2026 13:42:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB643254A2
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:42:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604566; cv=none; b=YVQlvKbnniwb4HwvIbscLKpi42reB3YquTfEDHfRhAGTkqEipKYBjwvW4zmw8JYpvhzOL7b6u+ueXNLhZ5LrshAMCPZp6NSeODFcdqjT+ChLt10jWowiSkDLZNiMWQQPJ+fwpUIpviMtuWKRf368yOwGR1lPS7+CurMCN+yvPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604566; c=relaxed/simple;
	bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dP+VhKAPY8UsJBQfAU2M61v+pAxAG45NTndJZ4pkg9ARcl7bUcbGfQifFmQDjs6/naF8kaFOvMfxGwGBu1cciobexKVkWu0/8eD3Oq/vj4kNhCIV54nZ1zk0Kl6HI3NJxa1V+bw+XFX6Dy2K5W6ZeWrmWeHiI8FdypRf39FjVk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWxBYymy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S6grsNXF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN5M91715887
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=; b=FWxBYymy3HMALBJR
	aYPvUURuekqh1leJ+SZLvJefacgkveb+++g/b5f98UgR+GTPAF47/OojiMcGM/2C
	aHNf+UJE5f+v7Yq92g+lZ6mSasS7oUEwG1ZK57RpIIJJygtoGt3OXF/ko31t+9qB
	Zt0zl/ML655UEC9Bh2d+n3y1W/CcFc5CDbW+gDJieltjZ8LO3dgcX5Suxurm7dEi
	F+dZ6eYa/165j9maVKyXr7l7VbUKlSSte9M1kORjCRrehtO9BdzGF2AZqSTPn0Ss
	Q8omxU82HKMZcRvM3nY78WLrZCbBIiLo4RmmFakfsVLpvJ+x+8uBWTcaQsDIxLj0
	qjofkQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vv4ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:42:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e7c36621so475264137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604562; x=1784209362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=S6grsNXFUwwBIzZRoChGbx9NY6kRXdU4Dc4IxXSccMnyLznITJJCUNDpi9+JoXZwAc
         SblfDG8RqC7nNEWedy/AkzK1Uq4zxb9h26FxfUJITulg5vKWBRwJpXfMzlHMISTtLTdM
         qfvmXuOMYQbIWa1vC072Zc/nOEgiWL/zha+wqWsbuSHsfcCbOQLVbSyvDiaHgzVwLo/5
         jco19kOMPWmZmiQ7iNFclakZAadJ9owYnUiZPz7b9j/n12CBcS3U9q90wG4F1pA5/iL6
         sVV+cw2KBv+aNMziW3Q7f1y8hpy+lR9vrTTCGzSv7flZBOc8RYlwXjClYPT78YhQLV9T
         uuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604562; x=1784209362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=rySEyOKQxenQqspU7Nk2IJmV9iCcahyzRd8iI5MybWT9IJVNa4+Xmn/0nogA9Yw21w
         cMPPhES2BLd17JtPKA5oBFXmGX78P78zAqYSGfu5YohsvqQhXn5AuJQDgTn1kYw3isPy
         q4RUOFH9x4TFJ1ObFCHku3saZ8/v+6ZjIrpEolUVl34qpuksI9E6kvOSvabgMABao2XX
         nW/YNsfhOXaouTVfls1/HljCEyp7vh5CnrIfUF4mmSstlqIxn253JBfdvMX7yx1kIQz3
         XcbIv/v+287Y4F2NaW+K1lOqnZfjVZmPYG0A+obob+BtZf0TkzzZZy2jIQH0rH7CzTmh
         ++7A==
X-Forwarded-Encrypted: i=1; AHgh+RrH/UEkB8Tmht1e3ms9iR1jlHNTmiQf+8SnlhCzXRdGtoRXdKN6uXCfzR9Ctzb9cuO9fH8hTf+/G6inhesD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2CWb6VVyKib1UP2unPTtg81fVqUOPFBCt/RwWxTSO0qSU/emA
	IsoHalKgLvLZZcVdrtoUoJU9eHB2AMa8qKevfaDoKOH3ui1YMcsvg8JQyhkZRxYpNOQMUoZkenv
	fykhWnAXWNoC8gyGwzjAVXjb8y8FI6OADMXhG48Kp9wtvNp3Ep0gVpbHXs6T4060mm7WJ+QmcLD
	Td
X-Gm-Gg: AfdE7cknaE92/wZtmUQ6KHw3IArpOt9kONW4P5CaveQeRnKFJuFHjaQxSIzR+Vluz4b
	7WVKiqwZ/2aACD7LhWrkHRa9pzde/sXPf5dgMpT4FHH1tVjp/3olKiX8zYhN5sMud4/fYhYKxXf
	TDNU4506dEPuG8JzReGwhJTB45hwZX589jMn8Txi56SxAwcvbA1WyuWHo0vZ+//gxSNOjhsbCs7
	n2ph67/nzjW10LN+HfmgWQMsjC6EuVyN93JcdJZQk4Mb8zkFvTbazksV4Vb3yIdmPW4CcP8UPIC
	f4L4Wq6rR5i4uozH2OcE76tjzCr1CBJ6jVUqB0vJImIHMTqNboQbFofCdGFCI+qfmDdpvXH4USi
	F7WkTXkyOyYBL/owSAA4JJ0qHBfMzUCqbMrUkXG0Tr7PXOtZuVcjceOQ7P5MOPi78U3rgLzabCP
	IvJqBsS3sE7a10MeDmjE+2dxYu
X-Received: by 2002:a05:6102:94c:b0:660:d26b:506e with SMTP id ada2fe7eead31-744dff52b67mr4460043137.1.1783604562384;
        Thu, 09 Jul 2026 06:42:42 -0700 (PDT)
X-Received: by 2002:a05:6102:94c:b0:660:d26b:506e with SMTP id ada2fe7eead31-744dff52b67mr4460000137.1.1783604561868;
        Thu, 09 Jul 2026 06:42:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:08 +0300
Subject: [PATCH v7 17/18] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-17-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6Um3x0DVIhta7pt6Su24PLZGGj05AXnS/cbv
 /uOXE/dWFyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJgAKCRCLPIo+Aiko
 1UeAB/9I1h9kcsc0rZFPxQVvV9c5C5XdymJruOglX7gtc6BJIQcL0iuuybsm28TCQmtxTbbUd62
 d7bRpjC7LV/bH0i6KHWNpuAcoZPnnnRRg7rsKDRtPb83/B54rJ2WVdyYCXj4pyjHRAQ349TLoin
 hUcLx8C39cmP1dFS5QPTVszxyCOAoU3e4WSBbJG2MpeBl2bUl+HgSLWMGmMz2s8nfTH2iUGgJ6k
 NaOoMadqVt8oxxCOQaOxA+V9f+K+qjSD7YQwTFK4yzy8Vb8bagG626Uz0LfvtLxwYWZBNWpI1yg
 ncBrcfoM7BhRYdddCJ70dFbBUXLzFpjD6uyp/b55HeDsP5SN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: TewJpQgBaKOW0Gv5h_3qrdh3BqTVpJwV
X-Proofpoint-ORIG-GUID: TewJpQgBaKOW0Gv5h_3qrdh3BqTVpJwV
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4fa553 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=4ldMYZ-nzf-nUnInMJoA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX2u2Yc3K84zkn
 UW7ChZcbwqWIizQRSDFuBI1bm1GIEARUpcORCuqB2ACLBmnb8WRBVm3nmpjIRHUmSuybrjxSa96
 uo9Ey83zGdKWLr2S3ncsokygOzfDab2gDf0wgYkIlVSO9RhSbgIrwl72LW07mGK/+RpAI2SFyi+
 9QSDTYYLNhZn3347JwqPP9i0zwtbrZM4SuUohCMQ/7V6qG/hgAUPJTYNlXpbsLXNYf7LsJbMOfF
 erGGE7IsdaNvH9lT77Zg17FIPBx/dMzNrN91MmHR6mF/yXNlSB7p1e/+4JulyfjXA8MWFlr4WCQ
 zFCTj7/zNnKbc5sski9RotULLS5w8+dQaRw42IbYy/5+LSf7Cz67eArKWojoeJwEM3mRZBD9OrV
 eRQH6Vg/pykfYYildmfHByhdBTiNhUDw0cLBQv9aGpDb/0DfP5y+JEI8oiCn8aaf/Y4V3kpECbp
 qJTFJ2W+yOrf4Cog+VQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX02XAxjB4il7a
 mlF/OCy07PMnxZibmW5xhMHdbzZWyb6/OhYO190bS1FE6+OsTN0pfUyDYrWO9B6wRrWaeHux5CN
 633LP06+MMzpP3sr8uMYiRQCFTYK3i4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118026-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D35C731CA5

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


