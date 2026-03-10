Return-Path: <linux-arm-msm+bounces-96783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ITLCi2jsGnQlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:03:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E92591FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 00:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 607A03028E9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 23:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72BB350A1F;
	Tue, 10 Mar 2026 23:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUaiD9o7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6CCFHT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9812DB780
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773183786; cv=none; b=X8RuZDLm+2f7kGfuv6qpMTwgubmpZ39uCX6JwLsRV7w6kR2EslrxnP4ChBJCOuGZZnEfyvT146G+aSgJr22hKbNUzBrL87JgCsAPqNRGlfkw9giW3n1kxzIdXzZhgJm3hr2/DwwqRKo96YFzVY7f4H3nVYwgkiIX1EMDb9ootxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773183786; c=relaxed/simple;
	bh=9rPLcD8BIZrdbg8Oyl4ClN+isoL1y4oxPSnddoXMDL8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ijWDiFKepfizvpeRUlah625yDlkRIPnOoC4SVng7LgPgK/QGh0Z9rw4ErOZ0xmBpjeHKR2PG5goQvAurOQiJ2OqoX4Jmf/XbWTn3EsSXLr6cdXzxDhHf8NMeB7cnS5zznWTPCyluLL6wmMXQ8eNiUoFrVp74cRyw0zIJl/RF6kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUaiD9o7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6CCFHT6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHClxX1572929
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bBYHOAqp6lRrhRn0NU9dy4
	EisUfXlx6xS/crsALosvo=; b=MUaiD9o7zr5Ti5t9tZmsxKa4Ep3FoMCPE2f434
	hOsUY2xqD2czkbUvLvh2jEAM/yBd7FtEcictKON6htqolCPCRetyWBWPHHhhOPGn
	IS9v52WaKv5hZT1pP0PyXGycd8UVkJYjQbs8jM3Wv0ggZWdMw4w3pNGzMtcs2N0b
	BlA/OVIX2wBjGiIA4M3tD8z1lya+JTqbeHJbCSt74aV2uFcPw8CSyRfARgMEY2SZ
	M45NAhFPUDXfp6Hy/9rXGlf1aaqg2aGotVTH6afqWVN4Qfco8sdgFEyfgZu8LaE0
	UeHR3+XFJTkVL53MaLsIpRVCx4DLeeM1hMrCJJYI8prH9HSQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk94f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:03:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fde4d924f2so14780139137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 16:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773183784; x=1773788584; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBYHOAqp6lRrhRn0NU9dy4EisUfXlx6xS/crsALosvo=;
        b=I6CCFHT6yWkTvjIs+GIQC2kOy6egmCJ2Pg38ovnLZsrPiDwD6FKPvVKjT5DMcIvVJP
         C9UR0jm/8CbFPm7HOrQTwTUvSdwTqMV341vTAXH9P5aGrfTbRZf8ZBQsKUEXPMB0lCRx
         Fdz4SXex8fc6EH9R6dro6mrB2RAlF9s2oqEAfkdIV8dUu5nYnynylfIrpaw87sLS8a9o
         huL0kWiZFQx25DNf6UeBiSliojkw1068BPm4/iVAPmWB61Szm9Cw8ekPDYT9KxrtZpBa
         Iq1guW6BLJftR1EBVzvj1P2wMErik6qG9InDLCzb9bGR4fIXgwSSnfpnjp5LXeAIq9jS
         SAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773183784; x=1773788584;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBYHOAqp6lRrhRn0NU9dy4EisUfXlx6xS/crsALosvo=;
        b=p+sZg1IVWShPyQTbLBG59y0bOe7FqmwB3d1txej8ACayElmnxwFBYxDK5ETwKpQVYH
         L5KDZ8kPuu6Hq/zNKBi3IqYD7Dgp8d5HGbzWa6WzhlD2UzPxLZUySghFEqg/edoKXTnU
         Wiv2DNeZUMSl0NoaSmxSIo02RzpKO47V9GGHApX3s9LSVh29lPblp3NWwSXUHIn2BYJH
         SUCkNrYQZn/LbcLr9qOIQiCBjqmu75L5r0R34VlHQ22dc5+xitqBVD1pHwOwutEOgbmV
         9Mguf44YOg50t5W3ia2NWAGoGuPBK76lsnuxzcCIerKe9oIM52BQTrjOuN3J55oggdse
         oltg==
X-Gm-Message-State: AOJu0YyxWRYbWEwH4MW0E91XeOnEGXmuTz8ky08lMYAu3vupnVpZOtrt
	P3WPYLbThydMVrkjzZMkaPCtiVR1vN2I2htOLvDHR1vfJ2VGi8044OkVUKQ7X4bZ1y8p1wpYwhH
	JIK2XEx4QsqkxNhdNd/PqugEZNit0AtwVkbw0mXAZF+pUO8olu5J7oI6s+G8dHUBvGik+
X-Gm-Gg: ATEYQzyrR7SSbCWOQNRy2iG3MB9bvQg+NsOUc1tk7b9bBUCfSOfonU6J+3DhnsYq6fU
	DCtwbGSi1FHU0TL6wBZnmJG2se0FEuZ3DM9vkvdQ9ORJiMgN4ro21V+4ONisugsSEKwr10iqgnZ
	9owgZNE53W3ZUJyIHrK7nr7Cdx2ipisVPjwQW243wuCFVXSSJgt6NiDYwjyxe5u4N0PIvDh5Cqy
	6UJCudRaFwkr2lfFqOwzy7e7iYSMp3J6kH3XCeX4tUS0UvpMMnp3K3JtuEBHrde1ngV2KG5oQ85
	MCx7RgbwHgPoUlz5SQCYIVSd0oHsuVZjW24N5SGss6mXINGSAc/xCfI0JfvFBzrivIzOtcTvF03
	O+ylKng/kzCaYCLFTnTY5oZJyn79KN/f39Eg6io+r/DAfGNp9M4qJORj1GoAKfdMSSr8CPOYKnW
	2PnHTCKr1zN3LAYlY5V26oobvHZSqEWLQmToU=
X-Received: by 2002:a05:6102:f07:b0:5ff:dbcd:3453 with SMTP id ada2fe7eead31-601defb73c8mr183761137.34.1773183783755;
        Tue, 10 Mar 2026 16:03:03 -0700 (PDT)
X-Received: by 2002:a05:6102:f07:b0:5ff:dbcd:3453 with SMTP id ada2fe7eead31-601defb73c8mr183733137.34.1773183783159;
        Tue, 10 Mar 2026 16:03:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a74sm80743e87.75.2026.03.10.16.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 16:03:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Bluetooth: extend WCN driver to support WCN399x
 device
Date: Wed, 11 Mar 2026 01:02:56 +0200
Message-Id: <20260311-wcn3990-pwrctl-v4-0-70e571a18e40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACCjsGkC/3XQwW7DIAwG4FeJOI8ODGHQ095j2oGCWZGapAVKO
 1V599FEk6Z1u1j6LfPZ4kYypoiZbLsbSVhjjtPYgnzqiNvb8QNp9C0TYNBzAEMvbhTGMHq8JFc
 O1AWrZDBec/VC2qNjwhCvC/j2vuaEp3Nzy9okO5uRumkYYtl2I17L82BzwUTu4/uYy5Q+l3MqX
 +bXzYL/3lw5ZZSHIL1ioK3vX6ecN6ezPdzxTSuLWOFbUYwz9aBAU5jQCpgUoHf4jyJ+KPzhF6p
 oipHaB25Cjw7+UOZ5/gJvwNEMbgEAAA==
X-Change-ID: 20251229-wcn3990-pwrctl-cfa64f9d8167
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Harish Bandi <c-hbandi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9rPLcD8BIZrdbg8Oyl4ClN+isoL1y4oxPSnddoXMDL8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsKMiKobqc2hRxJ8iMRpZGB6e6Mbn86CcotC1Q
 Xt4m0C89+SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabCjIgAKCRCLPIo+Aiko
 1bytB/0TzSSxGHV/qUKB3wG+wh9KAztSO5g38Zx0wfniLr4+z1dFi+pvRvfm3AyZxv/fT/fvs6W
 LR6lcHuZVzchaPqI13F29SCrrj17x5dEQJWCMB7STYgUxjr5uLwRtrUcEt68S7G17bUFLkMapfN
 DTVF+f8Oxjq/8uTp7WxTJ/th+//xVjq52KaQSGKBgdOpOIXCcb+ThF3u5DT5//FWPL8i+z/9UzE
 CkIxS5DQb+Ems2kLswvbea02k8oG22j+DAftRDCbhEcnuPCoW4KJ80m/3Xw74ExAemw8swURGyf
 QBTovKmaGzcOM7CWzcVpUQeGJjKTNtZvUFp+kbwXYNO/1++b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0RdIDhgW_E9_IBJaiGsPFbV8XHQCXNV0
X-Proofpoint-ORIG-GUID: 0RdIDhgW_E9_IBJaiGsPFbV8XHQCXNV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE5NyBTYWx0ZWRfX2wDQTz00NuLo
 fHUrPafE2MM4CH+ckhXmswPi09fygIjAZKkBJvfi8fREBEsew1xiP6XmB36t+KYFeTnAEUgNTyE
 diEIJ4SlX2sumDo1oPCioH20uqElYNO715iY1mGvAO7y8xfCuwGu7btFGJ9+Pxqmvj9P+pFc9/M
 vjPp/S3UMtg1SXRtBidjKPPzsNH4yYuqPgvID30MUpA03TnXB1VjDi8jQ863w6E+eJm/V0EjpTD
 neRB9YK2EQ6MEPcQFz5CA4v5mAxIyUeCqH7wQIUQqMU9WjsAlOk0sF+8ILnfVpabQ+Fe7+9jc18
 Bdfd4vEHrScZCVWC59ONZ7IF255OtZj20mTgKiDzUAWAPgyobooLLwZ/g/UpsD+sFyz/Dl+a/7/
 tP/sMwDoIcsh+lHkNPmvoT9WegiaGV9BqUYo2f7k3RA3M9gDK1TZhuVEcbUDILVwPXp8suWnb0X
 u5DYPlJMvnDt0UvLfGQ==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b0a328 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sVAF8I02KzBGxPgs2jAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100197
X-Rspamd-Queue-Id: 871E92591FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96783-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,chromium.org,quicinc.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Qualcomm WCN3950, WCN3988 and WCN399x families of WiFi/BT chips preceed
the later WCN / QCA devices, but they still incorporate a very simple
PMU on die. It controls internal on-chip power networks, but, most
importantly, it also requires a certain start-up procedure (first bring
up VDD_IO, then bring up other voltages). In order to further unify code
supporting different families of QCA / WCN chips and in order to
maintain the required power up sequence, properly represent these chips
in DTs and modify drivers to use power sequencing for these chips.

Backwards compatibility with the existing DTs is retained by keeping the
regulator&clock code in the drivers as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebased on linux-next, fixing the merge conflict.
- Dropped arm64 patches for now, retaining only Bluetooth patches.
- Reordered patches, putting fix in front of the feature patch.
- Link to v3: https://lore.kernel.org/r/20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com

Changes in v3:
- Dropped patches accepted by maintainers
- Changed ath10k to call pwrseq_power_on() unconditionally (Jeff)
- Added copyright headers to the changed ath10k files (Jeff)
- Link to v2: https://lore.kernel.org/r/20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com

Changes in v2:
- Split the WCN39xx PMU schema from the qcom,qca6390-pmu.yaml
  (Krzysztof)
- Expanded the comment in the WiFi driver (Bartosz)
- Changed vddrfa1p3-supply to vddrf-supply.
- Link to v1: https://lore.kernel.org/r/20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com

---
Dmitry Baryshkov (2):
      Bluetooth: qca: fix ROM version reading on WCN3998 chips
      Bluetooth: qca: enable pwrseq support for WCN39xx devices

 drivers/bluetooth/btqca.c   |  2 ++
 drivers/bluetooth/hci_qca.c | 26 ++++++++++++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20251229-wcn3990-pwrctl-cfa64f9d8167

Best regards,
-- 
With best wishes
Dmitry


