Return-Path: <linux-arm-msm+bounces-106600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNVwCwmh/WmwgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:38:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 830BC4F3CD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 238E030036CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 08:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6AC377000;
	Fri,  8 May 2026 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoOE0DA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BH1ixk0m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3036E2DA775
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229410; cv=none; b=IV8tzYuyF7JMTBxNM4F2/FygDLohZ4DTt3YkCvCp6yfN74c7eOzJYRA+tqwn7DrwltAckE/ejY1mSzrsoBRvDPi5FSh9zsjgm03w3SGPNK+FYVwKdDHZiEUq85r5fuQNHmrnmV+O+VnRiM8haG//SohvFthDdY+x0k/JrDzoETM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229410; c=relaxed/simple;
	bh=DAppTPvLucR7IEtw9g/q6YLSFy9LNvl6CQ5HmqEGluE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oZ1QjLgmRNLPkZm//cIjeXLyjYVLohApgawyzpu5FpxYjf4QunfIAUnAZJGnNvLpMEcvsmP2UZ65QrtndXWdEZaWFGMpNWQt+wAE66fqRUhC2O5kriA0c/YdIoa5qpaqcprvabn4jGRqr+1AR5ywzufQimfa72HD4/Isg+p7Nls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoOE0DA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BH1ixk0m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484ecdY1417687
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 08:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lMgaUn1GgK38PmfYxorJOo
	o0mS9UvteQnNYm+tOg9uU=; b=CoOE0DA+gIX7Pe0tm0XKberbEVDx5duyg1HgLh
	k4P6AZUv3jW50D4+nkvmp+dIXLHxKRbWLKTCpbATythPKkp/M3SOMkS6nZg1j2P1
	r8XCym8wYSSo2okRCKK3hgWFQs2hnojsFyOnSsJniAA+OXZP5MMNhAHWCZdzUbVW
	cR3ODZVxKEUrEzSHoVKohzRvEugrEPj6Pqu/RxkX6DUqfjl4p0I6RNLEImKzxH5L
	kJMHgJ6vXnis/3YZd5oOX4FPlYe8BYz+aX0fCMRmo4BGNrGZoTKkfDnuqRBJ25WG
	ZvAsf+42R0e6eMPKeePnW+U6na5jVyZArMKmn+MC8fhTzR4A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhjqa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:36:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so1432449eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229408; x=1778834208; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMgaUn1GgK38PmfYxorJOoo0mS9UvteQnNYm+tOg9uU=;
        b=BH1ixk0mx6fVBeukOGwUYUvtBle79Os1P/BCGfi3LxSTjivHGxVqWQjk3/cZakQEmS
         iQb/MbWthAXYpyNtpoTr3nQoZUhwFH+E2F//F5u1iFyDltVk9wp1m+cLODjBwmAjT85H
         q8QLI+5xZc3/6+DV8zusn6xlNwH81Sgu5lttIhpRUuvv4J1wo+0IGV3Ddr4tLhY+rbyI
         Y7/7xX/SRziLXdvSjOngu0O3wND3HswrwjBgPOK902OdeyOYmjC2CIHx4Q9jtT8qJ6Db
         6dJX3+cT6cmDkQdNdkEv9wJfKqoGZJtvtuWAHxDlyUukiNMQ9CQUvMKTGTQxAaVBf6/E
         4OTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229408; x=1778834208;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMgaUn1GgK38PmfYxorJOoo0mS9UvteQnNYm+tOg9uU=;
        b=cwdn36M0iNc2W3vijxk9jcFqJ7D6EfDT1gjdtSRWggK5KfJqpfyAsFCh+aXx3uZMHC
         ieEBi0eXpnWbMyDPd45q+K7zUwbax/e4/mf+I3WeS/OZ76+c7yOlajrrf1d88Vko25pc
         01H3u2vd5M3AQxXGbvfURwwmNJJR9CFLUl1iXEouNai2Ugf2xps1IwZ4VagPX9H5sm6R
         ANhbybUFr5gsFQXUp7FVgnfwLDFkkfMiOgkqtP9IeN40y7Bsh4Av4L+SBWveVqXWvMRw
         4+QVv+3tx00uet/wBYdP6TZX5s4HIhou/owvcbhy5hBh0JVPxcILofwE7EUv/StaZ36m
         hOcA==
X-Gm-Message-State: AOJu0YzskkJSXf7grVBkARAdiBsZu8MIallhCAMyAgnyHanlzqLte21r
	xmptESnDBI3bpzYyjT/UdNSDs0gnJ5wHAWQ77mvU3wGczdkQPnw7nsuFF3NTfbJ4RMApPArgW2T
	0UI1YNDScqqi9XOeQCcIy3hnS/Msgo0gMrZhC+baquOotBAkMc+DOSwaDV8obNvbgN4iC
X-Gm-Gg: Acq92OFKVGAQSSy0Qvpj6BbD9d9fslYUm3QSmXDPlVe56vhoTEW9yLwSf3A/3lo/teK
	EBUwEGPPukHIIGYfEPcAo1CdFFo6ugQLx74DRP6UeJ60Jw1l6OuFoOETTWsl2nzRwjz7P4ZZ5Xs
	b3OyllAoBKl5nsaOOZfT4nnQdFUVlVW/a2hdbj+Jv1L/L+L/4yYPNecFQioy6nWJV5YGz+SrAp8
	ys82ynVrXrWglp/8HxkTvqtDWfYLkLidoigTLI7W7ixMv7aFKsD1rK8PS2EKaNFnRkmHRnhTEKv
	5XRxvlP3aJiDgnFWUIPuGfX/C671Ic92kDtWRagBUzF/Q6f2BFvHyfgt0NabrJhD7U81r2ZD3v2
	ndxYZMua0hAIqRTYZURGWiraQnfJhCj9kbI8+8nP9e3muXwvGrLPlIpUWkXecoWbYA3ip9rDtwq
	5nGFY5U10s7wM=
X-Received: by 2002:a05:7301:1006:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2f6e1e316demr2668503eec.4.1778229407890;
        Fri, 08 May 2026 01:36:47 -0700 (PDT)
X-Received: by 2002:a05:7301:1006:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-2f6e1e316demr2668485eec.4.1778229407292;
        Fri, 08 May 2026 01:36:47 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm1504922eec.23.2026.05.08.01.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:36:47 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH 0/3] Add CCI and CAMSS support for Kaanapali
Date: Fri, 08 May 2026 01:36:44 -0700
Message-Id: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyg/WkC/zXM0QrCMAyF4VcpuTYQC3WwV5FdxC5qkHYz7WQw9
 u4Wh5f/gfNtUMRUCvRuA5OPFp1yi/PJQXxyfgjq2Bo8+QsF6vCVZ4ycxBiZOhopSAzBQzvMJnd
 df9h1ONrkvTSzHiPcuAjGKSWtvcuyVvy7MOz7F1moeQ2NAAAA
X-Change-ID: 20260507-knp-camera-a070d05ec552
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fda0a0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OFdHJre5LK366wQswZQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Umw8gCrEw-HgxegDGPo7YIaSgR66qjHJ
X-Proofpoint-ORIG-GUID: Umw8gCrEw-HgxegDGPo7YIaSgR66qjHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NyBTYWx0ZWRfX+TbYN/F2OqbX
 CjkjarrB855bl8g1PEcKalfCGU9BL/+GQLxsY2KtyjS9lf6d5ZYwSrc5cOnY3FQMHk7Bj5fPF2k
 KgEGuR5FPe5xWrfe1DgN12W4k+Tieb9aLQMx3NC13U1h6dBbHf2L4jFzDGECuK9nNCBgk/1+DeP
 mLjFQNzm2NYMO47rndpIaessgRvQq94AFKvBeNkvz73nXL0O/d7veIgh7DA7cMSTtvez1ut5yr3
 fLgpix49tfvR84I5HX8G3uI4I7sYhagtGuO6K4bRAeF7AuNM5k5JHFPa/bh6tXYYxRgdhLs2+8d
 HWSxTVeOI1aCv/PdisLo7sUZHvWlwUF7lKAunVUxb4NDAwznOWEW7/rU1k9xdk4efwA5+C7SNEW
 /JQn68Pvogd19HV65wHLMMCjMxwoY8djI+Oz8n80rpsdCphHSPc5foe0/oIjC+XfGtfQ49uoKoX
 nX64IBnv4mpzmgGzJIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080087
X-Rspamd-Queue-Id: 830BC4F3CD2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106600-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series adds CCI and CAMSS support for Qualcomm Kaanapali SoC.

This series has been tested using the following commands with a downstream
driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Driver and dt-binding are waiting to be merged:
https://lore.kernel.org/all/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Hangxiang Ma (3):
      arm64: dts: qcom: kaanapali: Add camss node
      arm64: dts: qcom: kaanapali: Add CCI definitions
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 539 ++++++++++++++++++++++++++++++++
 1 file changed, 539 insertions(+)
---
base-commit: b25f15a8600145233c948b40cab6d7d57bac3076
change-id: 20260507-knp-camera-a070d05ec552

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


