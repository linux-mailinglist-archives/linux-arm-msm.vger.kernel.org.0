Return-Path: <linux-arm-msm+bounces-99442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALaGMabIwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:11:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6916E2FEC73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A23F30620F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5305B3845B2;
	Mon, 23 Mar 2026 23:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFFlNc5N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsA+4svy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC17335E953
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307264; cv=none; b=GJgvecSvJgvi2XK+r4kOjW0VV6y41tqI2jcka/6A/HzxWHHEW2dOLh1O1AG0J8o4m6BxOLppvtxH4OAlzdAIwkMDO9TTtxrKbfdUctURsAFV4HIg/+iktISJgEtu+CjEVHnQJk+xB75/hd90JJE2Pgc+ckc5RMflVZYquGF06ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307264; c=relaxed/simple;
	bh=2o5jPxBvY2eKgW/qA9UPPALJZetaDW375eJE1a7Prpg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p6nqSZXvBbIx4CQ2uJdJh++UjKIJIHvQcVdN3xyuFMNw46lnxrdbu17h4SIk5wVK09JqSp/WwBnUzzYOsjHjsiLSuRFphQtqf4JYee6XYsrgrIRrHQf1Ik8waIOE/x6bpFP8fMnrRbUSpZ8A3iPhbAvAwu+g7sFPTmDM9lRW+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFFlNc5N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsA+4svy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWRF2831804
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WIQztYLXTlgoQzXM1eTZiU
	m4Uqw3NS/9fH9IeZqX70U=; b=oFFlNc5ND1+5G3KnV91RlvLDpoFUs8YD38Cbo6
	MeEYegXDi4M1agj3g611K0X7j70Sjz1ldzE0rQ1IeOFPmCyKG6zFBe0S6fgdA420
	Cm48M7m/mGHAAK4rw6VD/M3j+3t9Z+JxNO3nXsP8SS2bv1fs0z/HmeJwgBFt/koL
	Qa90BdlmT4wmCzPOjmy7WkzXi5+vMTY/a9N6kclZDbAU2l64YbJQrmHe/Jn+wKa5
	RyaEC2cDzpPH7xRSXIs2fDF6z8uVE6j91IiqjU11tuV2nlVyMyM0bIX78Q7cHQPZ
	Dcoua+xgmkx8DL4fne9QmUXltFWGwDcLwXWgcus1yMv+hdyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jsych-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so246588561cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307260; x=1774912060; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WIQztYLXTlgoQzXM1eTZiUm4Uqw3NS/9fH9IeZqX70U=;
        b=gsA+4svyLP+810zwjVxyq8fJOrIQ25AtBomv7ByZgveAHs3hE7H9iUYTfGGXTZoU46
         MsVKI0Z1A6V4wUY2Bt/p9E50IbpqHTIjG1fjcy7eEwz9CGE/bK627DxqC4kkQmt4CRWF
         Bzp3aSQ4k75Jfuo9dFZqjXvwP48bYn9svCk2aYFIBsTXKIPrW047JAwLAxOKuIFMSQCc
         rC7I9X8fOD7iHYR24Z9evN3pQdOz0TLAJlli80WrZhekXWH7lSIYSjHXRWK54oROhARh
         0qvvM34rXLlpzubx46MppszC1Nu0uFBwKB2Sbr4kxqZlQt6MJBjge2Cb2KXBItUofMW1
         B66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307260; x=1774912060;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIQztYLXTlgoQzXM1eTZiUm4Uqw3NS/9fH9IeZqX70U=;
        b=WOQHK6wTSyT1ZzuCM2opx9FfFJ7SegIiYDTckeAfv6YXx1CJd/7TN5O/OsjzSLATeg
         1H35oTxScOtnKQ2ohBtmMbMe/zhNH0Kd1lk2wcl7fojw0QXcASQx/Y9rjMu3fE9Ugzmf
         gwofNRybUSs1AkC7I7xwBMAhDgBN26INRgcrZZS+uBf2Wq74VriyLpx3SEvISyoUmTyv
         EblcfRbMbaVoHGCRlLZ/XiYNcWJtZZ4Xz+jtt+XpQj5bBVn0kwzpMvB0vr6PYUX+cYbz
         zpWCI5t6ov9q+g/5fUije8h944+MYwtUXCUO+5IFIZLZBzHJHUJf4P7gpxRokZaZwDxh
         wfGg==
X-Gm-Message-State: AOJu0Yx1pm3taBZvTL4Jp/i9eZ4bEjDNGiTH0C3utFuhkIf78Bhc2cLf
	9pEC0YYtgtp/6p+85+FssTgEDHLVF8PzzE4l8oLmTLiKNzJhHAnlzinhoM2jfO7jL5nH0pomNdh
	csOYSoPtTAq4hvIUEIyz1oVGs5ljv26dx1klsLlQhG/jIi9hgGubl4Q1mbMuKeq1w21Vm
X-Gm-Gg: ATEYQzyX++gAdixX1V57qqjRdePIop2CdDJn2eqwFPtap+y75Oa+OZ8Zw+USqSBOOfR
	QxeLXJ7P80LtBFXdzKWi9PHR+w8tLyUt1bVsLbUM2r0Td1K0svrrJMgozjvZpaDE8Y0doN0pRUF
	0wVqjw07sYIjJZN8HF0hVEuY/8T6xEUmORz6lwpojQJT0xceqxTyLyjAzRAG2WEHaZzPNu/ZTBj
	ziGfErUj7AtEEY+tJx6mQf+A1dxff65tN7/zyWpa4Mwtb9Hmv4CpnzjL9xXQFeSHzaQ2la+x77v
	1kihL2lbfC3U5WTBqGmtC65X+SZdDOjJV9z8/HNPyub+5Lz6NnnyfDbcX8hOvkMOq2KQC5mS6BG
	+dHEdLxnOBZ8etT4cIQPcFSBtWeUo9YHyPOKhDTsnIvBV+nJTFGF6PkMpUF9j+aTWY7zyYhckw0
	tq93UILk74Q8y4ZUog/4s8nIoaS5Ku+AVPL7Y=
X-Received: by 2002:a05:622a:118e:b0:4f1:de87:ad90 with SMTP id d75a77b69052e-50b6ed42bdcmr19744591cf.4.1774307260121;
        Mon, 23 Mar 2026 16:07:40 -0700 (PDT)
X-Received: by 2002:a05:622a:118e:b0:4f1:de87:ad90 with SMTP id d75a77b69052e-50b6ed42bdcmr19744191cf.4.1774307259684;
        Mon, 23 Mar 2026 16:07:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae39dsm2777970e87.36.2026.03.23.16.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:07:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] soc: qcom: ocmem: let the driver work again
Date: Tue, 24 Mar 2026 01:07:35 +0200
Message-Id: <20260324-ocmem-v2-0-a9daf5bce036@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALfHwWkC/12MQQ6CMBBFr0JmbUmZEgiuvIdhUdtBJrFUO9poC
 He3snTzk/fz8lYQSkwCx2qFRJmF41IADxW42S5XUuwLA2rstEGjogsUlJ8IPereaxqguPdEE7/
 3znksPLM8Y/rs2dz83v9CbpRW1g8XZ6lt+86cokj9eNmbiyHUZWDctu0LkSh3x6EAAAA=
X-Change-ID: 20260323-ocmem-dfe2d207d0e9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2o5jPxBvY2eKgW/qA9UPPALJZetaDW375eJE1a7Prpg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwce5DRf0Khf86AahuKJIyVwdGCfkY9icKC597
 F1DD6T+HZiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHHuQAKCRCLPIo+Aiko
 1R5gCACHWv5GWgHkum+i5C6coZDjZE8tUfsJuw1cNbVImPiO+zuSDbMyaHl6tFzbrb1iS2vVohE
 LVCh5GgQzDMCQCdJ0faMPwnAi6pQkrNTDoKIyFnOrFZ6aWaVtJOYTlLfcf/jw6nanSED1GBMzlA
 eB0cDJZo4nty3QGCYivwSqoXYtkrTVmbXj89xUCZdIZp3K88w9pkfUt8g9IssjGyy8zm7pUqW4C
 uXnAhxbP7lvQ93RzPJ9nx6KMNCchYhlV2gD5/oFoRKvGdE6YgBcYn9b2QHECp2vD4WiF8Dj0dOD
 jeOWEWAHrJ9RkUNxBu0t3vUl98R+o87PZftAK8QBuVVy+VV/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ExR9qvFltB6Grppl0MpwZzt_50sQoWSA
X-Proofpoint-ORIG-GUID: ExR9qvFltB6Grppl0MpwZzt_50sQoWSA
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c1c7bd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4fm7ATiAGqVInmB-0GUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MSBTYWx0ZWRfX6T+08vAFtRfy
 MQCTvA3L5miewNjI5EbmuOJPNSXauDE9N+AGURWcSjZmkYpmQ9QCRMAPgGWq0RzTOHtKtn5sqAK
 VF6qgWQF/5lGIXLc+RQEHRHJ/tiookdwnj+0O2bE7G4+qG0VvDr/n8S2LZAguSLdBIWvN3exW7U
 x58YiyspitVw+pH1ZnLvbpkSIQ3uh3sOLaUWK73EFIoy05mlydKR6ye49dbW7g3JVL5XTolMfNN
 OrnigexjyVAy1zxdxiTlnxLLOPR1vnjyB0LSfEe0DcEoCkragxErf4vV+TdpOYBgi/A3tWYl/FT
 smVweTTU6T0xu9X4egUrH85SaSdxuM+QwveKGIQs41kDw3lH9sjCigg9825wt5E64sriqEtb2Yl
 I6qqFzu7xpb0po4Dmy0wWhZHZwgN45pQ0FiVg5CA8eXtxU0w5mh8xNOriP/pLZTIUyjQn6yBr7k
 vGJinDwvhL5B8OCYJ+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230171
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99442-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6916E2FEC73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
clocks") moved control over several RPM resources from the clk-smd-rpm
driver to the icc-rpm.c interconnect helpers. However it was unnoticed
that the OCMEM device also uses that clock. The clock is not required as
all OCMEM users (currently only the GPU) will vote on the OCMEM NOC,
bringing up the clock. Make it optional (and also apply several other
small fixes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Switched to dev_err_ptr_probe() (Konrad)
- Link to v1: https://lore.kernel.org/r/20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      soc: qcom: ocmem: make the core clock optional
      soc: qcom: ocmem: register reasons for probe deferrals
      soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is not available

 drivers/soc/qcom/ocmem.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260323-ocmem-dfe2d207d0e9

Best regards,
--  
With best wishes
Dmitry


