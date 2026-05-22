Return-Path: <linux-arm-msm+bounces-109355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO+LIeVzEGoZXgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:19:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E055B6C59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E268300DF56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6269B43635B;
	Fri, 22 May 2026 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rn11n1by";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEXaLWpJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C7A472780
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463105; cv=none; b=YOT165H/rfcwbBZBKfw9DItzLM331RinN7lLZmrHEbCzcbqZ/CzWVtC4LYtb7j/sEmTsxPV8q79w9S8wtMKxCESROzNhwM9IO/mJWCCSdCI9jXm9rxJJw81RuhV8lDUoFIvVZYmGJe/ihNEnAghiHFAl6wu5O8X/8YedRzDTesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463105; c=relaxed/simple;
	bh=5xzbxVE4zky4rnTKO3zxGHdYa5RsWAP5zVmb3Xty3fg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bkPLozrq8MEttL1dJSA6QlhO0rGQOirSUtigLRnPJbOJX/EDVQjY92Q8rVIQC69v6Iyb4ihZjIHt56IY4FVecGTW+Poaxb12px+/jXAre5bv+O6Utn99qtvpIxL1E9mcrtOLnFQXVzwv2m0GDF/y2RWi+yGnTwRqJ7oP+gLSDIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rn11n1by; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEXaLWpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9Aocs1816074
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b5qd0Jvl8aH9HRjSEREJvf
	KNf3cggNHxWlONW/RoqxY=; b=Rn11n1byuvPM5NlHFhX9fP0DCXRgTcB9f2h1qf
	BWlBWX3xeik2JrKetT8Dwg5oCh+1xwlVjIpxEPHSwrBmqiRopGGoXwJIwFjtFo6O
	Ry1Thj2ylOr/xYQMTA5oiwnHQR9/XhAGoofyfWdrcRDiW8lbuQLQOiYSQP5zlK0t
	b0ghlx0k9KnA//833tUtyUftansrq8wTzyDa+VAKjTr3N11X2DcSw1q2/D5CFwzn
	GRblcV3FOB5swi2g1dFJvWjh2RBwDxKj+sN0jqD6CNQ4Aevjzn2LMLBSCSWH0axg
	emV12i2+/T4mjOY0GyEH80qBTHEFbNTkOiiWe9UBeU9TJG1A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm2mgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 15:18:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83536dc3be5so8520322b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779463095; x=1780067895; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b5qd0Jvl8aH9HRjSEREJvfKNf3cggNHxWlONW/RoqxY=;
        b=SEXaLWpJzlun+HlqmuhaDLdd5Me5t6ZVehr3Mnf5adIvCHwipA4iwZWcm3e6IHWZ57
         q5TQSGb8qfvmxzXIM6jvREjnD/docbwCNqZZTy/ehfR9hFQ71Tvtqt7pItOJ7ttls522
         ggbfMNr5LVZN4I/C4PqXmP1uPNkQJsvFDTugYksfVGp1qlgKRAmusTppaffAVZ0mM+CZ
         APswmr0Bc39Poyvwst96PfNh6tZhnEnEx7chl+XWp+CHMFw2GlCaRb3fMmNFemiDowiK
         hLK9G0Ibdt390RZV/D03KS+rhyxuStY+LCKszOaRIPMGsBF9Ra++ZqIMR/b7HcIEYZZ4
         J7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463095; x=1780067895;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5qd0Jvl8aH9HRjSEREJvfKNf3cggNHxWlONW/RoqxY=;
        b=QhAl19HkkPCLnK/8MCZq6Rk5wbULqLrRMiq8045ACXPLkQNeL+Ij1V2xJKhnCH9DIv
         EP45xRNIKGzd79dxrc1m8XAXH2AdC/UW+5ZgO7R1ZnLClduH60IZ7ieg010osIrAv9JA
         /YbbH1m1+B4JZS+8iWaAuc7Zh+6Q0Tgy25Bf4HhONJGhz6H+iURCPMI9hzBkm5qyw45c
         9AhD0taaJJtJqXDmwmSYYD+K/VXQPSkajt9IJpujj6mr08OHYWyhmuFz4uQcUYoL+ky1
         2g3YploqfGDsQzD8IkS59F6Q4gFsQLsj/fBWrlYEydcxY88bkHwyqoJPgehyi1T1mf9T
         lxAA==
X-Forwarded-Encrypted: i=1; AFNElJ8aP59Wzk03pjWXeKZfR6Zw+KMKvvPe91e1Dn5r1LD5EW/PS957CvzJLTXmY3BZKSQR0iXe8JLoDNy+iblG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ieOYk0hbHA6qLMjKlm5+LhbCwkprMFKIFSFEIFeS1Xf2iGNm
	jWXl2lF1Ig+XlQR/4yuStifTGVz/vdevVyUQfKCdecjlfWw2HVtMT415P1FCplj3GIi9s+mroJf
	QrpReTC2n+6FtEW2hfGIaYXn/6kXY7Bvl8ujSDBquQwlxOom8r81KEAbAF/cRDmhG7PN5
X-Gm-Gg: Acq92OGjcd24FcKcmFsnhgb20C0aenY2Pca7Onu3agkNasmbQIhjR66CNERZgRnwFK/
	yopfuh0dTey5MWO4iQZDPq2XhKnR5wTzBofJDZJ8huVKHhhTjwlgRIGMeJtzN14y5zQV3QVEfnU
	ZZz9lX9tlO+QSKdscuEnpZWEO5OYpem85GHi0wEZc+No40lOCC8AV+wvlmuCTVwcqiYdW7vaWr4
	yUpEk8ekxRL96A2pIges742VkLg5kPsBp2fFRGn2IQKwCUCAkKnZYnUF3TCZlUWYrCG0ViSHaXZ
	9LJnSJXCoef47Hh/oDdXAh7RQ512lp81DauBMreUGZ5cP8JokbFjEgEqyqZQo2Aq/pgpU1+aq/V
	WXy+C7oOzQE71/DwFzMXL3THJUHaRJWWG31WUGynY8Q6kX/h4uLOu
X-Received: by 2002:a05:6a00:ac0b:b0:82f:7b98:e499 with SMTP id d2e1a72fcca58-8415f303dccmr4421003b3a.31.1779463095255;
        Fri, 22 May 2026 08:18:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac0b:b0:82f:7b98:e499 with SMTP id d2e1a72fcca58-8415f303dccmr4420961b3a.31.1779463094724;
        Fri, 22 May 2026 08:18:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe97c0sm2083042b3a.53.2026.05.22.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:18:14 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add cpufreq scaling support for Qualcomm Shikra SoC
Date: Fri, 22 May 2026 20:46:21 +0530
Message-Id: <20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEVzEGoC/3XOTQ6CMBAF4KuYri2ZaQGpK+9hXJTSQiO/rRAN4
 e4W3LCQzSRvkvfNzMRrZ7Un19NMnJ6st10bQnw+EVXJttTUFiETBiyFmAP1lX06SVU/GqcH6pW
 sbVtSaUwqADlAykko904b+97g+yPkyvpX5z7bnQnX7Y9MAI/ICSlQdclykZiE5wJvnffRMMpad
 U0ThUFWeWI7DcWhxoLGchAGNCpRZAca32ns+DcetCzjCnmBOsH4j7Ysyxf1owL1XwEAAA==
X-Change-ID: 20260430-shikra-cpufreq-scaling-aff690130063
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 9rYB0lTc5CWkMj03IGI3tutTxVqcug7B
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a1073b8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v_g_bJvqKrPZ60Du8zUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1MiBTYWx0ZWRfX+uxXXUo0f8DO
 hXOZbnFrN8CetgfwqzkswhoHzRB1R43YP/2BNIkgjB0vZ8P0BkekivJGJYj2ZkDVwAhXdxHm0ON
 k4+FpbxU7mgguO0thAH7vctKAoSEtDWjAxt8SSMDpmluqcaUpF6B6WCwJB817m9YkIFzRG70aXY
 YgJxiwyqfNXE3Z3uyTcj3g0NQZ+d8PIGuJJdqXHYj2sHAcf0VsdLdeOxLFIaPUgFzggolb6lx/C
 BYqEEJ40j/6rcVnh9AwNBNtGFMARbt35vLhNLSB9SuOlq2surGpoLFuRulnBh3t/tyIPSsDETwI
 TSQ8L+rfxTpfFHv+Gzxxn+MIDXHC+KFIaB6HGj0UnbxPfDBJLRP8Z9ra4+387eOCKvqcvKgLzBZ
 5+oyoXO/eJuAk6i+7IG23iMSKT6r5O+fMCaXKBSAAOzilRFQhEc9wgT0VjN7u9NPBdyCW9ZYAhD
 Tmn4pY4SrWR2a786mUg==
X-Proofpoint-GUID: 9rYB0lTc5CWkMj03IGI3tutTxVqcug7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109355-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3E055B6C59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds cpufreq scaling support on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v4:
- Drop CPUFREQ and use EPSS in bindings [Krzysztof]
- Update bindings patch commit subject with correct subsystem prefix [Krzysztof]
- Link to v3: https://lore.kernel.org/r/20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com

Changes in v3:
- Updated bindings as per the review comments [Krzysztof]
- Updated driver patch commit text [Dmitry]
- Updated compatible in driver patch as per the bindings
- Link to v2: https://lore.kernel.org/r/20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com

Changes in v2:
- Dropped the generic compatible approach, and introduced Shikra
  specific bindings [Krzysztof]
- Updated the driver patch as per the latest bindings changes
- Added R-By tag received in V1.
- Link to v1: https://lore.kernel.org/r/20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com

---
Imran Shaik (1):
      dt-bindings: cpufreq: Document Qualcomm Shikra SoC EPSS

Taniya Das (1):
      cpufreq: qcom: Add cpufreq scaling support for Qualcomm Shikra SoC

 .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
 drivers/cpufreq/qcom-cpufreq-hw.c                  | 23 +++++-
 2 files changed, 116 insertions(+), 3 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-shikra-cpufreq-scaling-aff690130063

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


