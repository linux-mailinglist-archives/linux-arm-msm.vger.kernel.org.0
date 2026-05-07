Return-Path: <linux-arm-msm+bounces-106354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMQKIrSO/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:08:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEAB4E8E98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 826413006942
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334BB3F2116;
	Thu,  7 May 2026 13:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWB9IAfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tyy1CDQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D53E958D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158991; cv=none; b=oXPYEEoBWi1PdmHfW9gEZpprDAHr377IFo68o5c7oV8uG/UhfKeX7ahaAkw+OeH7HsgyXp27suZMUWri03tO4fBfPtoLKTIJ2qIQjcVjnTFxEraaOle8Pw7HcBsQT4Fh/VdDyfEtt0tWCv9eeOHNlJgjxFpjelAzX1bDa8ErJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158991; c=relaxed/simple;
	bh=CO5tfN+499tvaXP1CHeXqw4zhbrG7t+QQHj1USl4veQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kKeKheyKoEqtHA23CDg3Q06SKLRdTQFv5rLfuUZQpxdT7L7+iRfeyeJzctCOLQ2Vo9Uj2CqryeP9xG6eLezTJls69wgPbE+ak5R1tvdcG9LJzboXFVtelquBYfpEEbsm7du5dzg7y3uHfGr7K8SKaKKdAz2PfU+M30l22WAxEaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWB9IAfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tyy1CDQW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64795ogI260349
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yP6BlX9MTBbBZXOHamFcqp
	o/Q6taTCzMdwFPHVrhtZ4=; b=RWB9IAfQWOYiQVR1Maa7/Uk2/qhRacq86MZdkk
	6zf2NNK0f+6NdKoAsRVe/qJ16VD5oGoTPZzLSsKHuJYUvzDbedIbIxy39Yl+L3sc
	Ytes4qpjabmGLlH3TFfPtfWkipQv9JkYZyrzlffriLXOROAxiB0m5yBBrJqv0pDr
	7pzgx1pek30J2uB74OeAuHSdP9ZiRUqafRAMkP+4U18ceN6SxwOuwB8DtsmckYeE
	fGxOU3lgxe5zwLiq3OX+6LBvfgCsV/z26LJ6r4PBD3z6sjrse0n/98r8sWBD+exH
	gUYwEQNlMuLuS6mXERpMfP7xZWz01b5n+IpbJwtcrnsPbDYQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8t7gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8234c06a10so391163a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778158988; x=1778763788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yP6BlX9MTBbBZXOHamFcqpo/Q6taTCzMdwFPHVrhtZ4=;
        b=Tyy1CDQWzoNzpIHncpdIxT2GgvcsBDYX7iBqmA65+tG6zLYCZSpFGlOjj6558uXngo
         awbK/kngG9nhjnliZ+dNfraVe2Tth4+POxGdA6zSHpp4wloQ2vHf0KkGBh3pfMr7GwQs
         ZcyCzJ5O8BS5MRwVzoE7aXcMLwggUL8tJJzQ7n0RwgAdcwdxXXMC6iRXIS79ypP0s+dE
         w4rMaFw/DNIAE1uj6L7N79XdVNikj4iwIUi7omnBnGXKvgBdUxw4LBLQMmea1qwR+wzR
         m2PFDS+oj3wumwKvPtTTtisGosnGh42TbPQOZ9dADax9Ycj9KDlz78h1j1f/NuEVtDPy
         a/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158988; x=1778763788;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yP6BlX9MTBbBZXOHamFcqpo/Q6taTCzMdwFPHVrhtZ4=;
        b=jFSZoxWWMPmXXzCd1na/OJ7fWAkW94pxEdiSEEjTTmSKeHSgbfLPUOvlm5rInPU3n9
         TzK2HEvfwytIFnZ9a1cQ+gAvWnbwk9jaUdnikXE+NDEPIL3oTlMeQUgRZanIr4HsvNWY
         J/5Gj1TnGEumhCXEfbb1/BLUU7JzNM5gQqtg5zflFPx2BovDnGHG+QHEo7hNFOe0CSsn
         3+z5S2fKUOpqrvlfoTOr6XaWn0KIEicvu+F6wnsixPhlVJpUaJYKCJPlGyYQY5cRj4t4
         TDLEae+kdEsGE9INsAaOhSUidRls2lN2jqsJbaOb02aBxG1qCN4XhbAU/7K9O3KHrjqt
         uwFA==
X-Gm-Message-State: AOJu0Yw675nnoznI3FDnBqF4i5xGT56ltjs/rYkW0QGszyR9bu+kwbRf
	mnOyiKSdYOTpyPGp+Oq8kHLtBVIypTN1jmji073MPro8Dlkc3rDn8FvQNGXJ9uiV9/Sc/19KEXo
	fxm83rv61hfRfBgVcth/uD/S4rMNMvR1NeSBCx0WBDw2QAA/KLKwdtO1zB6wQ2onklRfn
X-Gm-Gg: AeBDievtFFDn+Up1guL+nyofm8MiaIpv+AxQjjhGmRVyO/X0XzNaBo8n+mfpLRRN0pc
	2kpaZ7BAtxCEatYFmeVJg6B12UVhcdH6DiQaPnx4mYsXx3P3sgIX7ucRcejrqaxaYEVfftH9ZYM
	DKqn8euqtSoLWByODWq1wk2QIWIX+bBspe1XCA3ntBONzRWEHk0GQ/wNb8GAzUJhur4bjwL5YYM
	ilVq3BmbCseUzFe434Je9IgKe5Nje58w1BGA8kUf/Ryt0+zElhzShaY9yH15Ff+Z58yO1iEKhXi
	hhKvGb902l+Hii8dSxwr76XhVAiVsWhLbNZlZhYFZFFXSgIApvxkVE+O8FZWwgFCjxIu5Q/4sJf
	X/U5vHKDQoFehyoLmyZmRdnnhLuKJisM1ChF8AFD1BzU5Q9T72V044ovc0vPSdvZBlVcEihS+EX
	sZKl+lKDp5U/xZfy9RhiBFAbJVkisW/rpsn7gosh9gXZgxNw==
X-Received: by 2002:a05:6a21:6da9:b0:3a3:a894:327b with SMTP id adf61e73a8af0-3aa5a90d7d6mr7807747637.25.1778158988135;
        Thu, 07 May 2026 06:03:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da9:b0:3a3:a894:327b with SMTP id adf61e73a8af0-3aa5a90d7d6mr7807661637.25.1778158987441;
        Thu, 07 May 2026 06:03:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/29] soc/qcom/ubwc: rework UBWC configuration database
Date: Thu, 07 May 2026 16:02:56 +0300
Message-Id: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAICN/GkC/3WPzU7DMBCEXyXyGRf/JLaTE++BOPhnTSxIQm0nL
 ary7rjupUWwh5Vmpf1m5oISxAAJDc0FRdhCCstcRPvUIDvq+R1wcEUjRpggjFK8mpPFEU5L/MA
 gLFCnwHSMoPLxFcGHc6W9vt10hONaoPl2REYnwHaZppCHZoZzfp50yhDrt852LHZD0xkrXRnSe
 +tM6zveetUKpQ3XrqNSUSEkEQJdTcaQ8hK/a4ONVpcalhPxEHajmODeeuc9ZZ4Z87KkdDiu+vO
 a51BWxW3sDvGr78YKQvReUuWZprb/B8HvEewRwQvCSFBeEUKl0H8g9n3/ASEVBSmYAQAA
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4306;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CO5tfN+499tvaXP1CHeXqw4zhbrG7t+QQHj1USl4veQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2D4TCvj69nv3UN3jfpQZjSuIJACa9tIg1XV
 nOK8917u4SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNgwAKCRCLPIo+Aiko
 1Q7aB/4o6BEVNYS4UGGq+RiCbRTHtktv31BwHBNrg/PCHeF68kntmlzTPGgbrO1Y4EwQzMXJmcc
 lZK0ncPfwv8Vr9wKQUORvADfzipJ2iAbKUDZjRY9OfwcjRP9CY9mURSiG1/2GshDfmNil/eGzHn
 iBwk4dC+x5i57uvTiyr4qLNbadMXcaguN+G0heW3UXMDJzi2zTVgXYKw9wa1MxwfawjKKwF25Rv
 uarCTuozEmnpbeEEzGN8LS71lmu7hJ+PNoIz8oCs2cclBA+OhT8qoCHJh+9e3cv8jDw5YZ2L8jt
 eF9ZiFn/8C1tUV9qUTG8Q+glOxqq0PGJyjO9AndFUEL2xXiW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: SjDODwiS1V8uxwWUUGmCIhMic4v2v63g
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc8d8c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7hJuk1173Q_9pT7ms5cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: SjDODwiS1V8uxwWUUGmCIhMic4v2v63g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfXyjwNXrGkebgz
 TWbRijfiF4ErZievLDx855W5o+QCQlpn3G1JyP5zwxaxcUauxH2Pp8t3R3/EiwKTctn66bjjAJW
 IRmJgLF6iSwczzL4e7abTXGuC0ViEVxGSzL0YriDqLxg2VMAs33jtLnn5PI/waV3xQrKmQ7bdeB
 3CxsfVOAFY4t3cHnPUVpm6RSymFuzGaNg7slCUmSYx++oO44CPw/fuJpZ7s0lTnlpxAG+S0jcN5
 fFHquh/lmvgMo5nmdKpBQLvmHos9wiCUh8w5cjaG5pZyQYQVhET7TOjsXty68kIroSyaJWbQzEV
 IR0AaEhqn4kueHZxXrhyR7IdG+DEup0Xt4UwGJicomi+HXoENHxN+KsW20oMD+dxVzJaNKfgA/9
 UuxY81VcjUJI0tY4HnrqUMRxKyr3lRK2X0NdKiyTrroOjQaCwrz6rrZ9KqBYaUng3kOo9uR7EnT
 GaRECS48srJ050MYfzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: DFEAB4E8E98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106354-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Currently we store several settings in the configuration database. Some
of them are incorrect or not completely matching the expected
configuration settings. Others are directly derivable from the UBWC
version. Rework how we handle the values in the database, trimming it
down to the UBWC version, HBB and several flags.

The series includes patches for drm/msm as well as for the soc/qcom. My
suggestion would be to either create an immutable tag for the first
batch of soc/qcom patches, which we can pull into drm/msm or to ack
merging the first patches through drm/msm tree directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebased on linux-next, dropping merged dependencies.
- Reworked A8xx, simplifying several corner cases.
- Link to v3: https://lore.kernel.org/r/20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com

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
Dmitry Baryshkov (28):
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
      drm/msm/adreno: write reserved UBWC-related bits
      drm/msm/adreno: set fp16compoptdis for UBWC 3.0 formats
      drm/msm/adreno: use new helper to set amsbc
      drm/msm/adreno: use version ranges in A8xx UBWC code
      drm/msm/mdss: use new helper to set amsbc
      drm/msm/dpu: drop ubwc_dec_version
      drm/msm/dpu: invert the order of UBWC checks
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
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c       |  50 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  39 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c              | 120 ++++--------
 drivers/soc/qcom/ubwc_config.c              | 294 +++++++---------------------
 include/linux/soc/qcom/ubwc.h               | 103 ++++++----
 10 files changed, 235 insertions(+), 487 deletions(-)
---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260211-ubwc-rework-e6ce1d8eb520
prerequisite-patch-id: 5bc7dddd09fcdb4f534f8468ab3ad51781667066

Best regards,
--  
With best wishes
Dmitry


