Return-Path: <linux-arm-msm+bounces-109110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBGDJ+kZD2qLFgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 16:42:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C79E5A780F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 16:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E7C8317D5A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624A33D88F1;
	Thu, 21 May 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRt+5L86";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWMoYe2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164903D7D74
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372384; cv=none; b=RhLUoJqe2Am0LkdrudKMZnDnrLNIjqG+mzox8rAplEGAeav2F0vjQP5I1U4sjc5MQv5SxAfIih6y2Nr6ydMygRmgqgwH2a4G5TYfFRIpBChvebLiDuX8uoaQ8wsbP2lCxojCr0IVSkIExqAIDhbVZbP2fqhJEN2Z3N0m+83JKK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372384; c=relaxed/simple;
	bh=9y3ZdYxQ1rInJVGpUROVKIIH9d4ExlJ3gXRl1keGvNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lvjW9ZCbEkwpNEi/KPz7qCEkb/RjKpqoZempBkqu7tDwG0y5wQtkHte59CJn+DgcZVMY05S71/zTWF5lFflGcR+Ty0Fq+P/8fieMkh6gWmt4/GKLrrUf6hSP7XV/8Utc0+W+kZ+rrp5pUQqDrZxE0YUi9PKW7chT2T3yU2UbRRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRt+5L86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWMoYe2l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A0683528418
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QM3P8PzgJm+dl7DUTcWreE
	3kVwtqS0QLfbrS91c30uY=; b=YRt+5L86dVcqDuOlemlCQZTjt8uF1PGrbU1UT4
	KHyANEgd3ltfnz1JcFr5nXX3SmI/3MXWSk8rtRaAiqtaRCe7fAEADKujarJUDCXi
	SrgxcC+wKGQy2Xmjg+vv6x/3LK6nXwSPkQ/yEiSoxesfqL3JCeIo7ccuCYUpa6OB
	Tvz63v9YOcOilVpn66UjcobmvQUFoS/XW8Yk1tSaLyiBXFFVbvemOOfKvnMtIlg/
	48wmAHFHdsGbTPko6ib0YZ2wCzlOs4pnqs0vPSWYsPIbtphOqjxl97qMSzNuY/So
	K+J+tjXhKCwJ85Cge/oTNvAzmi4Ev6TBPxlNsM/dE6Rm584w==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbhxw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:21 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd726a9569so117597507b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372381; x=1779977181; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QM3P8PzgJm+dl7DUTcWreE3kVwtqS0QLfbrS91c30uY=;
        b=PWMoYe2lvbCU5eGj+lzT+ZI3VHdhzVkeLowlKq/FPGJN/ppU7bVoBahLVzT+C/Obif
         Bthlo+F/brqKBv5fqhZ4NtKJBIqLwwFp9OR/bPWD6/CR3nWRRq2p3O0z94XKmlBi9VIf
         lTXQPjrX5aXx86TjZZ1rOAKzb0MRJXo5+5ce52LYSlOKuVVpCiuXPdqzvO9WUyg4weL4
         3jM0z7Y5PzKmVEN/C+6vYWqgxUJVw+6icJo6rDyCvQYZqKLnN3pMtqOOavDkMKa4waun
         pHeryDFCpcADWgRtNP+UbOu1/IlLm58f0soDtslfchFIcS7iHoAWpq7hkDK3fV9ecF3C
         m0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372381; x=1779977181;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM3P8PzgJm+dl7DUTcWreE3kVwtqS0QLfbrS91c30uY=;
        b=dsUJhO9Of70TXe385WM+nLdCwaaX0MB/T4W1qDpOQvazsVrL3FHMxDJTuGtXflK+1J
         y/CIm30CtXZ+DPFN9tuBo407YG66bmZitojpAGIno09EmO/RSAYKuN5sk2CC35HbxQzP
         W7Vg1ssB7gW/8aVnROaMVuQywk7BvtnW4z0NAsZu0IErxW3doT08x8/khXKUGi54PWPO
         hIT+4qK5gefRh0M45Jpp0uGFS1qvK8+MhsMGnvE30RV3V90b/k/49LWePH2dNYO0nwug
         GD9i70jeMb2gWPys/aMPNQNnGQKVbNYa75TOJqR3kCwl+fQczlHWbCiqjvvSBgk0e7ZE
         ZGgw==
X-Forwarded-Encrypted: i=1; AFNElJ/7jOuJouabam2jKjVR3378Eg0hhqU1+Eraw0EHV8rhV/qlj4Gml6W4vR0t9uq/MxKpxBxPK3/C5Axb5yjN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9kJGYF4TTWjU33ToctIUbmRoycofK/YHnvb2QGhz8pLSMcD52
	ehDa4njYJ9hvKsBFF69rQ9mEtWAp80rADfRTFWaqbOvsvWtJkcu3gVZlSMTAIo3ExvVTOxGMHag
	LYsaxMnDsMGxTBZX+/hJHJUD4oXVY4ksV9MyChfGah/O0jknzIlKyojj1FAKYUWxRi8Bb
X-Gm-Gg: Acq92OE4AB//fJF2Iao+C7MktT9drbc40MXTvY72g7KbWbtvm5CD9te5eXvpCtLTWn7
	ihaPYqik2V/ceMwmDnrYRo0bYktsPsUcKEigsJiI/LZ4N619iLNsZI36IiK2YqKLTxI48Q4UIdI
	BB/uT/pcg+UNsixZv5fxuxIvuv1LO9gKcEQGiD9F+KWsDjHkVJe6OnKSmJ6Yz0VDyNFdaeROMAj
	Bz4QqXUv+PKeQq7l2l6yYcIhdmMj8r8N5EgOpxsGw7O/r3DFy4Wz2cq1INiUiWNtSsnWLlL4Vix
	KncJWocbi6kN9T/Xn2abEuNvCVRmKnUbcvsrwYZFFDqt4Wy4hVzzUJLLxx0FKhjQr/71HJStUZe
	cU9Oo8pUTjOT7nIqrWTQfezKmNH/GWHIvPa20tMd8ZG/Y8uAHUvZsvlWafJhg/IE=
X-Received: by 2002:a05:690c:6c0a:b0:7cf:af41:50b0 with SMTP id 00721157ae682-7d20c74cafbmr27935447b3.36.1779372380509;
        Thu, 21 May 2026 07:06:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6c0a:b0:7cf:af41:50b0 with SMTP id 00721157ae682-7d20c74cafbmr27934697b3.36.1779372380000;
        Thu, 21 May 2026 07:06:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2cab7a5f9sm2920677b3.39.2026.05.21.07.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:06:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add cpufreq scaling support for Qualcomm Shikra SoC
Date: Thu, 21 May 2026 19:36:03 +0530
Message-Id: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEsRD2oC/3XNwQ6CMAyA4VcxOzvSbYLMk+9hPIyxQSMw2IRoC
 O/uwIsHuTT5m/TrTILxaAK5HGbizYQBXRdDHA9E16qrDMUyNuHAMzgJoKHGh1dU96P1ZqBBqwa
 7iiprMwlMAGSCxOPeG4uvDb7dY9cYns6/tz8TW7dfMgW2R06MAtXnvJCpTUUh2dWFkAyjarRr2
 yQOssoT/9GY3NV41HgB0oJhWpb5H21Zlg/l+MvHEQEAAA==
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MiBTYWx0ZWRfX+4F7tT8pMOBM
 qKeN7s7iMoRzhvuz8mkdnayv0LNCkWIR2osffolxNio6WifLqPWqsgJUc4r+GW5L0y3uH6MhGEw
 kHrQqzxGAOcIUUOa8IMQDAcVDcqyVQo0ZSY0KwX+STVSXBVDRbaC3z5YWF6hzGeX5x1u3cllcqt
 p6JFfLnqgXx1nto9ZanCslDIlcnTytNaCdxktWudDyh0EdplUZ+uifKvWqJjrGt+/N3kOAcVoY2
 /NRz3rRIllLBXXv01IpLjV/Us1l97vlLkhVhkfWyL7pLU5KFAWEQEEXTEDlCmWA6PA7XqEFrS3i
 Kl3pTA8LHn24Cmxx/sJQLgGSNiJBEIbuiJuKBJ4lnDuMw92Bx5X5YEkptsnADq9MtQwTU3MmQH3
 3nH8bsP7bRcwESSLRYBDUIJ3YTc78Jnzw0ERGC6RM28mes7yLdk6DaWMazXpnCC79YaCLKXtpfO
 mZ66mbmvp0vufF4+6aQ==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0f115d cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=65fuDPeu_usOQaeP5yMA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: D3tWrSKcGhacrDHF-VRoDg9fA9icj3Eh
X-Proofpoint-ORIG-GUID: D3tWrSKcGhacrDHF-VRoDg9fA9icj3Eh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109110-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C79E5A780F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds cpufreq scaling support on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
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
      dt-bindings: cpufreq: qcom-hw: Document Shikra CPUFREQ Hardware

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


