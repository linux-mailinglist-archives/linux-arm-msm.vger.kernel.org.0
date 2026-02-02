Return-Path: <linux-arm-msm+bounces-91423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKVxKkNNgGlQ6AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:07:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685EC910E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA5C730233EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB3030E0D4;
	Mon,  2 Feb 2026 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kB3JeT3p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R36TLnnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A591A30E837
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770015989; cv=none; b=TbbATCK14cxc0J0acBWW/Ql9GoxvyA3QU2Rm5wV2twu7BSdUPBKd63QMDbkqpfNFaeQ/KAaSys48aQY+INIx+mY8REHJxzENeKzjUBkhj/PrPV6XQjRhDlLaUUoRgil6/TJ7ji2HhjcBlx/uj5Vdm3lG4loqpIynxa4Jo9lHQKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770015989; c=relaxed/simple;
	bh=xiCHT/wFzjlKiC/fOA41wNa3HTCrPxnBhSVnSBKv400=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mElI/5aEoGUQXo/u/81ErhR4H9djk4BJmBQD1uq7uMvn7qskvAzkesZ+IEffEV9AZiCEzmvFMQzj2ryf0sVBa2fEpcLUneQWLlF5UPeS3jtgML8IP/lHyOBQK71cSQ+105yg9NJTgSyn021xH4OQ9bKEYLi4sl6tAeTIX+RTMtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kB3JeT3p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R36TLnnq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NFvix1244296
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5pTsG5jQcf50c4t/exdRGNh0EFMedHBavW+
	4U70mX50=; b=kB3JeT3pi8GN7duI6YpXYMDXYg17q2oO4ubYAEtpzsJzAL9zQyg
	8d1zPGCJlyWXsWH2cJJlroEBUDN9SFrKBt+QCKDvWh+bnpTTH4J5K1fEi8w5Qu/b
	QeYZ3296qb+4wxjAt9KnMjkTfHmtIg87prjg1Iu1kkTHY/p8I1ItEZRlx2InXXh7
	xW5A6K4Ix0jlxArEDdhx5BDEmga4Q9a7mlZfu0q4k4Ng2poavLN55To4G+6caXvc
	eCp7dwckEKtYRdm5GaS57u1XeZlEf+IbMkmCD/4bNHxgsQq5GOfII23A1s1+ZcSG
	PnTnyuGDRbo5YmXlQDjK4O5iNeNPKcBxXlw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnvb2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:06:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so3802550b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770015985; x=1770620785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pTsG5jQcf50c4t/exdRGNh0EFMedHBavW+4U70mX50=;
        b=R36TLnnqHZBI7HAktg8tp4G/vmaDd08YiC4grFzL04sQK+kYWfXcBwgyuwqOf9Ue1k
         AP4M0ilDT4m7y3UO8RdoY1j3BL6GGb8TM8t5FdxJBQSiD6TyfHSuO/x/uqL6n1ugAK9D
         E0G7peWYxk0tEANFPUqE11N+CDHDSI3TTfArGYbmKr5cheZhyoBWuRbuHN9JBnpzujT7
         gr9xYgQMYpj693x21DlA6LDPCdlIMZisJ8oSo/39uqwUDirP1jxY4TGwBS6fLA3B7n/r
         NP3Eb5WpZNtDQHOhDlsDkv6F3wEQmtDxotnw38bkfH1iu7NhSSfasebokY57PDgRB86o
         SVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770015985; x=1770620785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pTsG5jQcf50c4t/exdRGNh0EFMedHBavW+4U70mX50=;
        b=a6P1r2l7g9fP0qu9Wek1lj8RPCiPe3vyV7kPt/hhT8ZDjVvYyE3S3XpyM70s2zHn1+
         wFm1x7XN0JYcC4nuABKE4yrlDtPB1Y8LhcEdOEf6M7M+LSkwHUJBDvCnHZ/tm/CPK81X
         IiyWgpivA0Tvo56wgmX9ciTJbtPvx/6lQSrlJi+Ylshpp4IIue+SMLoWG+Dwm7ibKHxP
         Nxmx6RIo/WZWtb/HF5mktsVcGFj4j6GU5fKn0sZzdGtBZ35Z7LziNl69K6z98J/UrEqf
         i/7l+9cFUfjTSwQtmlo9eHfdrrCcW8f9SiruNm7JmHGlBn7oIbpRr0Hvu5hjQYhVZgG1
         gRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLgLqtyTC7jvjbXhWEUlsE7dkznmi3VgTRgGfMWcZ2QhIy11xRZn4Qd3oK2IRPv0A8ab6OeoKJJfgrLsrx@vger.kernel.org
X-Gm-Message-State: AOJu0YwoyVCft8t3saJq+EbTLn4AYC+XA+Agg+5RhSNdZ3ArlTNJy6qv
	gFdfk92+VvQSNLLHejf5U/rGz/dejc5QafuIFLJKSwobbZ8xMqmoE0lGeOcR9aCuRtD3nJoQwHn
	smJuLEyW9uMLQrvzJSkCDG5Lz/wAW/pFGKRmDs+5vHzFlXfsJVyc6ZMpo3uWwHHZvoJSC
X-Gm-Gg: AZuq6aLqQG8z1Dex6SBA9ZzYMyTi6PIEcMP3B4bZkaV9VkTQpo0vJjklMwrOvFUENjI
	6OT1qmx3ZnOa/06bd4Cq5UheNJoh4crnZM2OnF2cI4Qec9bhSJDuYntf0jveg6qzl24/XbTIta2
	msZimHzfz4K9rIImsSto9+z36uqPTg7L81bAcXNDX21E09OJlNsTdrqkwOhpHXMg63vCwYVKZip
	AbX1hUWYViUOgdzGdVsr94DRselTRpAocN1lgA1O+c979VI9OukRf8QCUMidUGdTJPZgGgP3B1I
	6ulhXcoz886LhJ0fT9oBozHBRibXPHwjazZ+o0H7sL2c2NKWdfupSWQOoqZwn2GIcFr2U1kLqm4
	0cS+PaAShwH5IgzxnG6cEa72G9ymRLqacSk1sSEWJJP4=
X-Received: by 2002:a05:6a00:4c9b:b0:7e8:3fcb:9b05 with SMTP id d2e1a72fcca58-82392118166mr13260155b3a.27.1770015985457;
        Sun, 01 Feb 2026 23:06:25 -0800 (PST)
X-Received: by 2002:a05:6a00:4c9b:b0:7e8:3fcb:9b05 with SMTP id d2e1a72fcca58-82392118166mr13260132b3a.27.1770015984988;
        Sun, 01 Feb 2026 23:06:24 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c54fcasm16265727b3a.66.2026.02.01.23.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:06:24 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable QoS configuration on QCS615
Date: Mon,  2 Feb 2026 12:35:31 +0530
Message-ID: <20260202070534.1281652-1-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=69804cf2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fIl7fISSXmXrEScvsbQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: lLR7s2uv0E7LDklyudMYRAppxOH7CnK0
X-Proofpoint-ORIG-GUID: lLR7s2uv0E7LDklyudMYRAppxOH7CnK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MCBTYWx0ZWRfXxmKrDsVvcaqT
 4fzsSdjvE1DHd5/fsnHNptbuSgyNFvVzJaYymqzzK8QcvYXuYUwpkp3NBMXxBH06ukVEPXXGW2y
 /dh0WUXVW8Fjy3AlFW0j3SIg/0lyAG0zWv5lKP+CSUnI66cap49hdYjBRx1f4xlZ1rhO4BXNcb3
 ZKYUIzd3nT3PRml3eae2/Sri/UEUc/wMq2PS3xhwD6yhex4k3pzcV8r+KdBdQLYPWZdU6ljKIRv
 W+T2POwFJkentX1GMIio+9xIAONwXHKRCTw0RvyV24zVNmF3b+eSVlb4/t2XiAJUT/Y7CQH835F
 ke9m9BURySd4g0UFL/vtX5XJPC4B+3eStVh+DqDF6LZNyD2U3rm1R36YW0gndjUCeCPyKed6R3s
 ZetK+MRuXsqoYH4PP8p+m79Pi9aM0rWgWhNUQ1fj3OkZvEPy5PTL7TTjm9vkE2UyzsIMcLAd7ou
 rTgCu77k+LVYDRwatmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91423-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2685EC910E
X-Rspamd-Action: no action

This series enables QoS configuration for QNOC type device which
can be found on QCS615 platform. It enables QoS configuration
for master ports with predefined priority and urgency forwarding.
This helps in prioritizing the traffic originating from different
interconnect masters at NOC (Network On Chip). 
The system may function normally without this feature. However,
enabling QoS helps optimize latency and bandwidth across subsystems
like CPU, GPU, and multimedia engines, which becomes important in
high-throughput scenarios. This is a feature aimed at performance
enhancement to improve system performance under concurrent workloads.

Odelu Kukatla (3):
  dt-bindings: interconnect: qcom,qcs615-rpmh: add clocks property to
    enable QoS
  interconnect: qcom: qcs615: enable QoS configuration
  arm64: dts: qcom: talos: Add clocks for QoS configuration

 .../interconnect/qcom,qcs615-rpmh.yaml        |  44 ++++
 arch/arm64/boot/dts/qcom/talos.dtsi           |   3 +
 drivers/interconnect/qcom/qcs615.c            | 247 ++++++++++++++++++
 3 files changed, 294 insertions(+)

-- 
2.43.0


