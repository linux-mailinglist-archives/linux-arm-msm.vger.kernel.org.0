Return-Path: <linux-arm-msm+bounces-97220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FQsNsK/smmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:29:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924727282C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52C8F301A2B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A116C391858;
	Thu, 12 Mar 2026 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psv9qyeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SksbCkD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AE1344DBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322175; cv=none; b=nxXoqxhCGhGe4Jb+Q9vB/aHVOEugSK7It/sUOUWPTTD5jeN3HOy+N7llESXWNyiLKDEdMNQ5Wp2KH/qGTQRaJnDZJnA4EaUYwskZtO+jzhtqkxaYIWbNINhjOOeC+6Dhc25r/wD27CdG72a5VIK0JHwRwSnEGtHajvsxUcyDbTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322175; c=relaxed/simple;
	bh=7P051BDy/qn7TYYBQ2mITI8KnaxCFZB8Z9mZuSCy0Hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OwOfJ/7PMKifFlyN7qos6P8JgGjCuYvvZt+Jg2fbM5KyrYeq2aT6vbCYBc8oWwuvqhOatFciQNb47VJhP259MWOaKcL9we52K5diwLMG/bKh3T87bxaD46IBF/VJau68aLVoX2e5WIq3CXCdaH28fyl3rkTqlBmjrEs5aDQtO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psv9qyeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SksbCkD+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9vLoV3668464
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mVLreosOAhfO1zekIJ6ufS
	Z7PejVizoC14J2Kq9mux4=; b=psv9qyeEXBJcmqtjTPGrgxiDKwBMrNDBh1dk9J
	FwLU+66q/lAFZ8mm1ZlX5BpZAGkydM0JvenYVi0WeXm2jDJgsAJl4WiyaNrh5JvF
	R97mxe5Gk9IVJzuS5meuMETqZE+Lo5FOp/S33BhBfBHyXzW/SDgqFI09MFkjlHXq
	spdONUa69jiaT05Gn2NtOgnK8qqbdwdF/BuU0HVn2u0ksdJ4lcN/JWmWFaeSuqrt
	70BwSMCW55FFFR842yyjhKOkCTZOLcI+airHufTWdtw1LPBpPgpvMJHnc+YnV7Z4
	7QOq56S6YPmWmGt6eqpJoC9lDnz4RRbdWDD4X7kW5EMGhcog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60j7rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so830892785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322172; x=1773926972; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mVLreosOAhfO1zekIJ6ufSZ7PejVizoC14J2Kq9mux4=;
        b=SksbCkD+8OsQYLo/g0nQ9awrs7RCxFhQUyVzMBsjbIBfX0TUcyJg3Cics7WU8OKtiS
         InoycYEY/l1AnsvjywwTzGbh/HH+MYzryqfEo040l9Z5OSYcEgDDWAOKu9cjgLlQOcbP
         Dhm26sCEU8AM0GUZr93FNnw6aJX0L/2Kfvn3H6P85JldxwbIf6D1nD6hCtLCxljIieCq
         PpMMBIt2oMYcrePaOHV4Y4wypaAohYiaTT9tNcAU9n55BfLeSs5niaOGsdEAf3O5yKyq
         b396hP9R3iE6pgf6PZbp5q+M/wHKh+Z8dQ0Z4RS/0f7dlFErt2HYGawgyzs2K9sBvFNG
         Bl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322172; x=1773926972;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVLreosOAhfO1zekIJ6ufSZ7PejVizoC14J2Kq9mux4=;
        b=HFrofVCcPf23oEsT64QxVaCWEzXYSAS7fS8cDsUfi8dg0uD2IDWVwPYTWLO2NMQimR
         4dJ5TOu2bURuIZhcboc+1A4nXcL8zP6zz3W6AbHMTyU43sG10THKQ8JIkaTYj05cnUAs
         XwoUEBYM/IVdEcjDQLonpiCoskh1Qg5ftAVeL66WLJks1X7fBZmAAD3pLxNXTuGCsa9Y
         Hb40+NIABYLzX26yBLrEy9DwTzdOK8FZ8He1NyD6AzecfyKN48tfryKjWbDMWewNIAWY
         RAJqAQZfHmvzqjeF466NMRd8RDvo6xZeuDvgOgHZ8Dwo14yP0P6girEHRsgwCf4iGXf8
         UvuQ==
X-Gm-Message-State: AOJu0Yw5ZQpu3VJ5QCKQZb4GqGv1ER6mc1oCQ0DgR+MCPwovsNo1S2Aa
	ua1WKvXkrWm8zh786fBAP16hlwdcNCJhug8L5lLdusJKByF2cm1CGKZyzY/3Plg0dajugkzBJ2y
	0X8W/CfvX6Xs1aCscyP9dKZRUNzaENo1PDfRSuf7U77VpEeq4+CB9fxJS2qUt27kJPizo
X-Gm-Gg: ATEYQzywQoxaN+AHBqRIbzVe16M3Wzwz3FMhpYr6Sxza0grOuPKQuaeWIDnFpTMzwVF
	zezSbncTsE7TgiQFhKl5tzXE4Zj8E4zjRka30OK7de+loM/05ri4MbkP/To73dV5DzPyRW6TvMW
	xUYdix1khRAtrZ9W30D0R80Fc01rsRLpheg4tvEik/xFBAPHRFNXwCWPLw3BMLDcYHLf9goHFIt
	Qz0B0NRx6QLodQ2bMUa2o9wsqtgCpFTVj4zn2YDmhheNLbx3RGFZ9LrCjTIBYc1At2WDMlIfgqj
	9KT2McJfZYsiNJU4nh0yUK7KKZIGK+jIUebv7mZPbsuXBWrQwMtB5SEQuSaZ25og6iEhv2g3OmV
	QOcPPw0Az+oevZ3W27odXgxbGlEiNElCgZpdw6G+Fp8vGqlcVevtZyLqgeOyig8OrtYE2bhxN63
	BDj3GF+fokRiStjl9h11VdWjGzCt6GteUSee4=
X-Received: by 2002:a05:620a:1a06:b0:8cd:8bfb:a48 with SMTP id af79cd13be357-8cdaa84bfa8mr419299585a.28.1773322172359;
        Thu, 12 Mar 2026 06:29:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:8cd:8bfb:a48 with SMTP id af79cd13be357-8cdaa84bfa8mr419293485a.28.1773322171748;
        Thu, 12 Mar 2026 06:29:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/27] soc/qcom/ubwc: rework UBWC configuration database
Date: Thu, 12 Mar 2026 15:29:21 +0200
Message-Id: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALK/smkC/22QzW6DMBCEXwX5XKdeA8Zw6ntUPfhnHawGaGwgi
 SLevY459EfxwdKuNN/szJ1EDB4j6Yo7Cbj66KcxDeVLQUyvxiNSb9NMOOOCcQC66IuhAS9T+KQ
 oDIKVqGvOSFJ8BXT+mmnvH/sc8Lwk6LwviVYRqZmGwc9dMeJ1fh1UnDGQ335dkd0AGPXBx92SC
 Scqo3UJCru1eibgXNLkT4+n27CEXeZEU9raKFZL6Faer1Sz6bOq1qax6bHWGasrV5eVk5WQSpf
 K1tBIEKJhQpBHmN7HeQq33NQKOU12LZn4U8oKlNHWOOsccMe1fptiPJwXdXrkPqQv49ItP4h/v
 a48IUTrGpCOKzDtE8S2bd/T3tgdvQEAAA==
X-Change-ID: 20260211-ubwc-rework-e6ce1d8eb520
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5125;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7P051BDy/qn7TYYBQ2mITI8KnaxCFZB8Z9mZuSCy0Hg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+0Ewu45cGDWJhFLSNZvnkJX03vOkNDPTAbN
 /W5B35Ik9aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tAAKCRCLPIo+Aiko
 1W6aB/4uJr187ZRPkR+qgBIzhsrxdz0rZygbS6fTcCvj5S31ZpWnGc4yLa3CRXAt/cNkO9u1g3w
 Ge8/Xl/67Wps34RDbxcWMzZE/WAqjPUUlEsGcS0ak486ZLh09avZ0vtSSnq++2c2vMIpgFtdwuE
 xsuryNqI6Rdqh2bB1aUXvIYmEIrdV1PUE05N+lDPux0JPqM4N4ysHTxMWDii6XtNKwgXELS2mF6
 dwgEsVIrXCpOj0PtPHKRWmY5xKqvrXbTJ834ffF4zdwtIXvRV9x3R22wCa6dghOL8yqOC+5SyzM
 ETLFikKZmVg/mTQzsxUK+doOaT+ALCpQy/Yg0g+ddqddHSbi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Xy-aEoC7jWmXrEClFPQoT4mfgbmUbRWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX8ksM69n/TqAE
 Q9mhEH1dWMDeYI/7lSyxLzev6UOZnSiiZFZu1udUEaulSrIZgoOEE06BGpifYnvcu3z2iDwCq+d
 +iM/zONfjmVksOJfNf7nQSYPyYqw7b6Pw6QIaJKOXoaIpqkPw1xyBicwU/nlVfzeFt2/AxyA/ph
 nK4xIcaco3vTmdm+WljMZhbmRPKhTH4wLdbSha+IG7G1X1LT8vBSrD+qApUCHZMboqhC0cP9Bp7
 H1ajy0DTNTMrFhCQtRaj2XslMBgS32d31nWWXGRme8bo8LTc8tPAnRqM2UIqRw/Ff/84qnNzXCV
 0FQ9oP2ErE3OEaLV2f2MqJ8E++ih903RJNk02MseRQ9mGxyR4E7gt+/lBCQBwU+LJU+ptAm686N
 bvqxdsixovTyp5nOysYFUsBxRMHHEPQS3pNl/yEApMxvwuX++HIjLdkA7z5g4qe46P3G4Of6+Go
 O86dDU2TEp8Wh36DsoA==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2bfbd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PwpGZ1U_RRFY7T7CT1sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Xy-aEoC7jWmXrEClFPQoT4mfgbmUbRWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97220-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5924727282C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently we store several settings in the configuration database. Some
of them are incorrect or not completely matching the expected
configuration settings. Others are directly derivable from the UBWC
version. Rework how we handle the values in the database, trimming it
down to the UBWC version, HBB and several flags.

Note: I don't have a good merge strategy for the sieres, it depends on
other SoC/UBWC patches [1], which are probably going to be merged
through linux-media. Any suggestions are appreciated.

Maybe the best option would be to:
- merge SoC patches from that series and this series to the Bjorn's tree
- create an immutable tag to be used by linux-media and drm/msm
- Merge relevant drm/msm and linux-media patches to corresponding trees
  after merging the immutable tag
- Merge the rest of SoC patches in the next cycle after drm/msm and
  media changes are in

WDYT?

[1] https://lore.kernel.org/r/20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Corrected UWBC_STATIC programming for MDSS 5.x platforms (Konrad)
- Switched MDSS 6.x+ to qcom_ubwc_min_acc_length_64b() too
- Added qcom_ubwc_enable_amsbc() helper
- Reworked the DPU handling of UBWC config, making it simpler to handle
  minor revisions.
- Removed the comment regarding the best guess for min_acc_length
- Link to v2: https://lore.kernel.org/r/20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com

Changes in v2:
- Renamed MDSS UBWC programming function to make it more obvious that
  they are related to the MDSS revision rather than UBWC version
  (Konrad)
- Brought back the patch to use qcom_ubwc_version_tag() in msm_mdss.c,
  got lost in rebases (Konrad)
- Link to v1: https://lore.kernel.org/r/20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com

---
Dmitry Baryshkov (26):
      drm/msm/mdss: correct UBWC programming sequences
      soc: qcom: ubwc: define UBWC 3.1
      soc: qcom: ubwc: define helper for MDSS and Adreno drivers
      soc: qcom: ubwc: add helper controlling AMSBC enablement
      drm/msm/adreno: use qcom_ubwc_version_tag() helper
      drm/msm/mdss: use qcom_ubwc_version_tag() helper
      drm/msm/adreno: use new helper to set min_acc length
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/adreno: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set UBWC bank spreading
      drm/msm/adreno: use new helper to set ubwc_swizzle
      drm/msm/dpu: use new helper to set ubwc_swizzle
      drm/msm/mdss: use new helper to set ubwc_swizzle
      drm/msm/adreno: use new helper to set amsbc
      drm/msm/mdss: use new helper to set amsbc
      drm/msm/dpu: drop ubwc_dec_version
      drm/msm/dpu: invert the order of UBWC checks
      drm/msm/adreno: adapt for UBWC 3.1 support
      soc: qcom: ubwc: set min_acc length to 64 for all UBWC 1.0 targets
      soc: qcom: ubwc: drop ubwc_dec_version
      soc: qcom: ubwc: drop ubwc_bank_spread
      soc: qcom: ubwc: drop macrotile_mode from the database
      soc: qcom: ubwc: use fixed values for UBWC swizzle for UBWC < 4.0
      soc: qcom: ubwc: sort out the rest of the UBWC swizzle settings
      soc: qcom: ubwc: deduplicate UBWC configuration data

Konrad Dybcio (1):
      drm/msm/adreno: Trust the SSoT UBWC config

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  11 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  93 +--------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c       |  19 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  39 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c              | 120 ++++--------
 drivers/soc/qcom/ubwc_config.c              | 281 +++++++---------------------
 include/linux/soc/qcom/ubwc.h               | 103 ++++++----
 10 files changed, 217 insertions(+), 461 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260211-ubwc-rework-e6ce1d8eb520
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-change-id: 20260228-fix-glymur-ubwc-f673d5ca0581:v2
prerequisite-patch-id: 7982b5ad797f83303a7fc6c932c0c6973114e2a4
prerequisite-patch-id: 5bc7dddd09fcdb4f534f8468ab3ad51781667066

Best regards,
-- 
With best wishes
Dmitry


