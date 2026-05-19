Return-Path: <linux-arm-msm+bounces-108580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKXOBqyeDGq8jwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:32:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 544125831CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5421830075C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277A830C150;
	Tue, 19 May 2026 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdtTGntS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOp7VLOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E631619D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211693; cv=none; b=rZJHbFg+pI1sz9ElEBDd1GHfi408rxjC9ARZSll1OH7VxdCrfNVitRDiYsUxApswWJ23pSHqRLY3s2C/YTt+GFl0vCiwzSK63P8zDBjm42rg4QHMgdS6xJ6MLKyvEEiHnQZYkjPk2yt5E8lrdyVTiJvUZurfelgO8G8UHYhy0x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211693; c=relaxed/simple;
	bh=MwhhvygqegwVnPDpW9RwHJgvDzXcoinmHS7+DbYP/MQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bUJdAZTWkTp0TQRyEOLR7TvLM3q3kdSfUV4AEwusQQLS7SQD9wUTjZ9SbFBsOjOuUPt6eapWRK+6n2oMlhFsqOO3qqgLxBd5k5ACDHRKnNezV3JGOjnCYqU47EZj5DDFru+xFZ5D49voEA8eQLQ7Qmq/BwllTbLATsvgOxwz9Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdtTGntS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOp7VLOA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx5KP2868033
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tHNaBqFD+p5JbhQVWdOQk/
	1p1Uv02C32Qb3jlwthWN4=; b=GdtTGntSyMMySfd6sAFGASYMI9QlcqLr/iLcLO
	GYYuzeNICqrWW1lBoFHG2IgbHO19rSwNtTQc/qgAjcWeHqQrhMi9F+1i7j04b52h
	L8blWH2RnHv1hWKvHxI5sLftCbgt1qudLF7Cj89HOBzyHZKxYCVPdUtdBohX3LpE
	iRxrBRe3kCeWyqBgvulOxJfd7yavwK8xOuVmqeT2JVJAUKiYWEMt1O+plwas7KEP
	wZ0LuaXumJrMXvjdTz0sEbJ0Vir8AytpEfwbv9xicFptTT+awlkbnE22gDpOAHis
	HyGwsm1tnp2jAXXbHPdExFzkxjEdDN6czVVBrYbhRSY+EG5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3w8pv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:28:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4530a90fdso58249825ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779211690; x=1779816490; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHNaBqFD+p5JbhQVWdOQk/1p1Uv02C32Qb3jlwthWN4=;
        b=JOp7VLOArKaomnC9bsjXgInmOqmmXpGpgW7fOOd49Sp6kFad1vo2M7WwOHoLoiYgxT
         FkSCoSWQ+wcslDNrgGkZMETbPmSUutbUkJgSLsDPfYvPQ69sUQi7YsjVIxxX+10YhYu+
         6wptjci+d2qwxzzc37j6+226eJ8yfnVNO5yaFtPtUgFMLxU/kEDpjXPtR450nHLwcdD5
         JlaqZu3iqwkV1bmYgIEQD05yONAyU9uQ6NifS8FzSGGEE7tw/GVFohSW2Hm/3alYo+mr
         jeYXJwnz3APiFVicQyeka5PuopuIQWVz1gyNmXaoSMrMI6kHznU+5uyFBKGRTij743xO
         QJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211690; x=1779816490;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHNaBqFD+p5JbhQVWdOQk/1p1Uv02C32Qb3jlwthWN4=;
        b=nSmO/tngLoQOzbcwmLoVhZHZxkF2w5CxNtiqtWmrRJtR3AN6mnp5S0gq95GNwDD+ib
         TpRWu9VXoioXSP+MzuY+pWj9pqkxRqlCspX8pRmvLf3sU4qoreuwhExlrcxnDY6wYY0E
         +wZHhCrhX3raQNMiWew01K8Z/JmYStdrpT2zGkrAMts2ltK8ly+F6N98iG9OOR7akQZq
         WX3UqDW4MO95zFCMASt4NbFQ0fmYK/iGdbg6TrRePpRuj8OFGGfH4kSIcsSdWJltbZb5
         kNfLIjKBtRkj51n7CH+1bny/plxbxBGRdmbOcbqrMLaBvHPb8q9FxUy3Y/XIObAnbqLB
         cU2A==
X-Forwarded-Encrypted: i=1; AFNElJ8pAEZMXwucnBaGX0srzrsEQEUTRXymtR2cTciFgYx8B3vNf9nqFlx5rZeeo0I30nXPW31EoBv/5vdRZql3@vger.kernel.org
X-Gm-Message-State: AOJu0YwiqzwrbVT8mw7O6j5C7tmZu5Fkq0XqbGNNCNCvKdpk7pcHuaQx
	Zc3BHkXrFkD5xKSUr4H8rvfZ+aY/71AGgdMBjaT8ZU1UFNhjRGdbgzQei6uWM9sG6cJCoAKeQZ0
	TR1e92lUrzbISucR/a20wGbf8z2rNGHGAwuFVaDJrARBMOhCCfYeEr7nfpSq823NCAkpExA0GXF
	89
X-Gm-Gg: Acq92OFAx5DU8AiKZVwUyfooAH7LKBOro6JwphUlZhAQTtIEeIvRv7Ryb7Da/DMYCG1
	JmVpQJy2pqM/M/GqQnGdwhPBZaQKdA8k7f+KUdWUX+AqJXy0JOEwnLLwzvRiuJjwpJX7uwHKtZ3
	sCouu+gVJ5UM+cixn45raYk3z3d6e4c0oGLJjmWH4WbpEQJTN4KuJ3KYkhwNWpv8AT1bZ2tRf2c
	93eEI69PQ3opSidiYP7AWXbtZZzPmpNR1TJjZplsUJctLNSBDifMglT/sIVotxgW8gHzeMcsQ8s
	mxCTl3wN10HchTuFiAkguf/3UxrA1fJiZYztgvd7+hrJKACjPcAG/WvGq9a/C4Igcw5BCwMs2l6
	0A8mIlPzEKh4ZxcgD8pBRWMJ1w+Mgbw8HKItKWZ9MLpu5nIwMdJhL
X-Received: by 2002:a17:902:d311:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2bd7e7e4ddemr148525435ad.3.1779211690390;
        Tue, 19 May 2026 10:28:10 -0700 (PDT)
X-Received: by 2002:a17:902:d311:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2bd7e7e4ddemr148525305ad.3.1779211689906;
        Tue, 19 May 2026 10:28:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d125159sm182248365ad.76.2026.05.19.10.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:28:09 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add cpufreq scaling support for Qualcomm Shikra SoC
Date: Tue, 19 May 2026 22:58:02 +0530
Message-Id: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKdDGoC/3WNwQ6CMBBEf4Xs2ZItFRRP/ofhUGoLG4FCV4iG8
 O9WPHuZ5E0yb1ZgG8gyXJIVgl2IyQ8RskMCptVDYwXdI0OGWYFHhYJbegQtzDi7YCfBRnc0NEI
 7V5QoFWKhII7HYB29dvGtitwSP3147z+L/LY/ZY7yn3KRAoU5nesyd7mqS3n1zOk06874vk9jQ
 LVt2weQOtXVwwAAAA==
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3NCBTYWx0ZWRfX9exdcpqljPi8
 svg6w1kZLNi+rFXQ+UwKXoWhrJyOZZVcQqNex5z4fUE+vTII4eRDsKVHAy6ehuhqwvBK56rdCqV
 gCUWFP4gLNGzo9gSOOUZya0HrsSdIJp5BYkiT4cQWW3rYTO3P/tHpL7AyOAxie9/qTh8wwNQCLr
 CO/zQmc8WMRz35RMif1eODvq5xUZnYd7IrOtvA+NvyVpwRtDwRp2pE1eJL8GfENdLcXQQ07il3C
 rRe/RHYAMn5xJjTr3raEY1GKwIv/w7A5cpQCsa40FL9ihSMpoGyXoK4f7FWppwIXXjIYl7kWAI/
 VvyZLeTJl8hO+neTFsvK4NxQOwM9LR+THnVV4Ocy0IZvcPjjnCvjH5ep6wE5GNwxZmDwk7jyYmK
 Car5rCo2WZ45bYaohpfkozZ0uQ1QF0UYbLEDs2wx+7YGh4E5XjK//az+/GgUCGjlrmxOLr/N92s
 5y4m+WuBz4/KJA7sxhw==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0c9dab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qdwp8Cu8RznD16sri-gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: raTzf9_XGdKpeHeZ84vB6e1gtXmXXpYB
X-Proofpoint-ORIG-GUID: raTzf9_XGdKpeHeZ84vB6e1gtXmXXpYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190174
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108580-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 544125831CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds cpufreq scaling support on Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
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

 .../bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml   | 133 +++++++++++++++++++++
 drivers/cpufreq/qcom-cpufreq-hw.c                  |  23 +++-
 2 files changed, 153 insertions(+), 3 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-shikra-cpufreq-scaling-aff690130063

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


