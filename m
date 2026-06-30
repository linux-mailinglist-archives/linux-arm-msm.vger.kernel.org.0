Return-Path: <linux-arm-msm+bounces-115368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q/5qLcGcQ2p/dQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:38:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5735B6E2FF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:38:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GMVYcIWL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Kx+z4UkO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115368-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115368-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49A5C3027A42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C303EFFD5;
	Tue, 30 Jun 2026 10:36:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74453F1AAD
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:36:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815817; cv=none; b=aOPDimUMT2ZvEu63wPzAw3D2kQZOnlOFXgAzH3M9Ju9xEPYg/dioDORXDkjXDe21uDQ22MnsqUMlQabh6LlflODyUOs5F67cVZ6+6/uR+Pjc15F7ts67jtklUmmz4pOandrR5/NTGvUngHGgQjSJc6I6lO9MMBLEaxUMLPCbek0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815817; c=relaxed/simple;
	bh=eA7ljmvwdyz4++w7TMf5zNrwXiZ0ZeNDR79ORRuve74=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m0MChojcBCBl0T3UGalG5EpIbW0t125Rv+hKCNjnFpswwTeRvaIbF2bh0I+2tJyGQXO4oRRDy+46sVXtYrV9yqA5lXGihIFH++sv77deX9FvChctm94UZYh+xPKYWWCFBOgcXiyM9AK8YMd4vFh2Kp+QDDeCEA174qrYL13xyiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMVYcIWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kx+z4UkO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxRg1613392
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CD+wYim3g5KeRGOfpKB9Yr
	JnjeM2lOg0wutreaHc8xg=; b=GMVYcIWLCR3rdirlMcgJrMG6ou2pg/CyIzMmeo
	/lxhkYXZYl+IFYRvw3Mq6Efj36evd296lUtkB7QrfUC+oOLFJXRg1beXlFYCw2wV
	tRXPadzziJLltEuUjY4AP+cpnVW+N24xXpcmqdbd48mxsklaaqpSbBTvmX3gwDHl
	ED/BSqkpkyrgUgAcTqtOMYYFv59pvxg7zIV1fVqj2uiGxoXqoE6ZhURvmaUIrDoT
	9aSsL+qlhrzN4ysqouNW7xCf7TndNMZKIKLcsyI6Dszvf7U57oeyZTjXOI//8IBu
	1nUDVNmRBV7/pDj26IgWt4Dn1JcP5aH+Tefp9eFscYGKF1DA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cubs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:36:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845a29d8c1eso3372772b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815812; x=1783420612; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CD+wYim3g5KeRGOfpKB9YrJnjeM2lOg0wutreaHc8xg=;
        b=Kx+z4UkOiqnMBhuyIx+FyN68o6TYyhVxY6AmwdzhQwIO3hQesVzxbTB5+b+L+xRR0R
         jvTVuRRnghLMb1Q/X0tpk9zJ+LBGx4oKRXGJDUnOq/DYO5KSWH7NX29WTahx7e9VAFQT
         JRFzQ2+k9O4D8SctnbjCPhUELksridk2zYlKoLYSbMjNzMisikjOD3LBh+4cnpWOo+0S
         K+Bm2nICCvBzMb6Eqe2P11gybiSnBU1HwCndUEceSUgardfGTNVUSmCDb6no/PeYDVdj
         iKYu+nPPYGZSkAkzTiKepS64b5d+SoaiV9q6ZQ6NKlN+HFUDyyKdD0223Zx1I5UrLW+K
         SS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815812; x=1783420612;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CD+wYim3g5KeRGOfpKB9YrJnjeM2lOg0wutreaHc8xg=;
        b=Ud7ku8ChKk+l/qmxe5HVQ/Geizas6/oVPD3wcqgd7aCkIPhkY3I8mlsLFVYD+kLdPp
         9adhZ9Kfx+JJ3Jdv4WjGxMdMj2EeSzXogWx9ScqlH7nKQAVC7reOo2IzpOK1VrrjL6Ze
         OSx7sb24QSPOoaB2m02z9tH2ndxCpM0239IwIYhE/urra0/1HCgBYvSRXbXygBKiWhvw
         rjKhWgKPtPJo7rLKBp31utLEXnyBhg02QGDbIGTum1iIqMCqWkZquc5ykfsO0rZ6ZuOU
         +p3QB/t4oj/YwoBqaLT8Vi5PxLCuWifwqHGm5Geul8XDCfAUfJ1WUZezyKlNeZEZiERj
         Vh2w==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Ln5IXRtFy5YUHuCAI3p1rjfUH0mjGyGIW38z0fumAhzIIUypr2eZUblcgc7QmtQXzVn2V59d6GGTcrSG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4M2dlW8CdCm3OjNDpb+OsjJ7mxi6TBLdAahAIaEehoJ90r4na
	OOTpTU33zFqihdS0hI8PF3Dm5x6Ja9YRwgvFOsg7XENCbkWr9CTaHWKeIfKBMFWw85KLvAbUsxS
	/6ii3ju6gcmRFN3JRrt2aMK4XPOjxnOsufMae9MxCUm7bVueTxUSMxJXSxrPNG54vmMkz
X-Gm-Gg: AfdE7cmNX4vBs+vmZGmJtudazxXOcDUXR8N0/q3f40GtOM8ge/EJkhiAm5ZkUdShsiL
	iEfwthsSXnDdOjWPhtGMiXi0TttWUTySUpymPfnwmJtXSoixTTVEyxVLFkkumiLGmWIHlTTGOQM
	3vc0wyyFNvUfshTqDYjnlzxqAFaEEyzd6QVWTnvcBvnW1X5g07g3ZILBKSJhSNLjfMeCGdZdPqq
	YpeYYjuoJXoCg/jDt9h22+v/2J/fwwur67qGNmgV0Qr2w2Ov5ssOIv+7G1wHMIHEMVG+M7Eih02
	qGYcf6yoMV+GgID0CpMbFO1KIjEWoqwkPCjjcoqBgjudtqZpSnwDWNzW1RIBoNjC328K3UrmH9H
	RfkXBFNGj6nLYxy8rWbXckc3LXQeOm5ABtFJrL9tzFPg6W8E5kkjiWaTUblhovN4FYmpe7eHKBg
	==
X-Received: by 2002:a05:6a00:22d6:b0:846:7fb0:4ca2 with SMTP id d2e1a72fcca58-847adf3995cmr102316b3a.61.1782815811704;
        Tue, 30 Jun 2026 03:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d6:b0:846:7fb0:4ca2 with SMTP id d2e1a72fcca58-847adf3995cmr102297b3a.61.1782815811149;
        Tue, 30 Jun 2026 03:36:51 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:36:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Tue, 30 Jun 2026 18:36:02 +0800
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOcQ2oC/42NQQ6CMBBFr2K6dkg7QgFX3sO4KKWVJkKxA42Gc
 HcLaxdsJnk//79ZGJngDLHraWHBREfODwku5xPTnRqeBlybmCFHySXmYN0HpqC0GbyGMfgmNYh
 mA1rmWLcKq9bmLM3HYFJ3V98fiTtHkw/f/VMUW3pAGgUIaLQuq0LUldXFzRNl71m9tO/7LB22u
 SMe9SFwKCtZILcSLYo/vnVdf9y9rGsXAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=3537;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=eA7ljmvwdyz4++w7TMf5zNrwXiZ0ZeNDR79ORRuve74=;
 b=us708JDKd989MRvdEFhDMwSypM9Smnu4pAnvSPNooABmIn3xgUDdkDPtxaAm2FeORLtRDlx8T
 iypniJuVSYsB7VsZl8fxdqq3dU5I8DFI5B+GrlgljCg6mcVRzxUygUP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfX+OYTXfnw7JY6
 TXH6BWjmUGZxFB9tSblmZWC/T+qSIjujHwgj3Q2UbIO/DCNJQbbC7B64dxvCoqoVXqNmO0jTp/X
 rvDLHJsTzSe5muoBGqo4DeOSMGUkC65gtTd9MwQVXt6yVZ9+aFDwpvi3YH+Adu10P1KYGDIirJD
 hFtRz9Obj2rUxcwu0/vvgYubbvsIwVPOGyQ72w/Ll3p1Sqw2gf47fmTrDAWlGfVVNrNb8Fvj+wP
 9/5+DvgZCnCeqT0wVWXctFt0QJ/p4EykPawHTZuBGVJ1gYmZgRbdf7Xm3hzcZpdMic1uCK0NYCm
 t3jRCqNPZiwXcjreKv9WPM4uCxL2IjB/ND5o7R/rxuBu3qf9cFXE2MqvaMShR3U2wZUdpGdiwM8
 G2GxWnEhi6v8EKb2hsbqcFk6GfXYfvbDr05BheZROpKhGVJV536+/+r7qqX8V2b+WNx5fCZi/VL
 m7Tr+zhLeO/WjpG7Mmw==
X-Proofpoint-ORIG-GUID: wdLXq1flD-zgb4arjRlz3yJuI-f3xgoJ
X-Proofpoint-GUID: wdLXq1flD-zgb4arjRlz3yJuI-f3xgoJ
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a439c44 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CPxOtKTflHPnepyb4PMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXwtwbAJRxzVsw
 bSg1CArR81513N4kROXRn+DJU+YPlzJb2MWfFhsPEv2Ff9IND8iYLLEbrq9sDVaJFcX/Jx5m2x9
 hONaeJ4JM+FyGJEhZOrjEK12j5jS9mQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115368-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5735B6E2FF4

The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
forces the device onto the AMBA bus, where the driver must read the
peripheral ID from the device registers during probe. On several QCOM
platforms this AMBA peripheral-ID probing fails, so the traceNoC device
never probes and its trace path is unavailable.

This series introduces a standalone "qcom,coresight-agtnoc" compatible
that describes the Aggregator TNOC as a plain platform device. Without
"arm,primecell" the device is created on the platform bus and probes
through the platform driver, bypassing the AMBA peripheral-ID read while
remaining a fully functional Aggregator TNOC that allocates a system
trace ID (ATID).

The series is organized as: binding first, then the driver support for the
new compatible, followed by the per-platform DT fixes that switch the
affected nodes over to it.

- Patch 1 (dt-bindings) converts the compatible to a oneOf and adds the
standalone qcom,coresight-agtnoc form alongside the existing AMBA form,
updates the select block, and adds an example node.
- Patch 2 (driver) adds qcom,coresight-agtnoc to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
qcom,coresight-itnoc only, so the standalone Aggregator TNOC is no longer
wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) switch the traceNoC nodes from the AMBA
form to the standalone qcom,coresight-agtnoc compatible, fixing the probe
failure on those platforms.
- Patch 5 (glymur) switches the node from qcom,coresight-itnoc to
qcom,coresight-agtnoc. This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v3:
- add standalone compatible for AG traceNoC device, allow it to be
  probed with platform driver.
- add fix patches for sm8750 and Glymur platforms
- Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com

Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

---
Jie Gan (5):
      dt-bindings: arm: coresight-tnoc: Add standalone qcom,coresight-agtnoc compatible
      coresight: tnoc: Add AG tnoc standalone compatible to the platform driver
      arm64: dts: qcom: kaanapali: fix traceNoC probe issue
      arm64: dts: qcom: sm8750: fix traceNoC probe issue
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 39 ++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 35 +++++++++----------
 5 files changed, 59 insertions(+), 25 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


