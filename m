Return-Path: <linux-arm-msm+bounces-99788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAPgJS92w2ktrAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:44:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2099331FEAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4115D3025E7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED2D30DECC;
	Wed, 25 Mar 2026 05:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEo0dEff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqF+OR85"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455B917BA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417440; cv=none; b=WYJxgvmpAgvwnUZBUVW9IH11aMKvlYp6WOhO1Tap0cDajdUzhlv8MJ2BBJetGRWdXkOu1qkTcA2+ViA7Wn1DdCsFxTpmx+T3Lley0emJSlP9XVkgefl23Lv/pi3sG/JxTnQ+7iFauSFpqfTZNiEVSuj10+jOdpLQwXND36J8ZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417440; c=relaxed/simple;
	bh=hfNnIy09gQAwSpJazpfbAL4y9Aen7kUVg/JvfuXPoDw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TcXmMdQC4tN1r4gZ+9hPtRXpJ8Eu3rqLiJlSaw+9yOPe/Kj/XgkYoSD3fwSQwCQ0LQdAmlasTg/H8v9ITOfMKT3DRwlJn9XmHDCOHHdWonDOU/HHTo6K2L556JtX6VOJbC/GW+Zfg0souKAxleEQd8X4jGrloXvVYBVlncjxnog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEo0dEff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqF+OR85; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4srFR3110448
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ID/7EugR28YqfHQLTwfLSn
	Xn67+/nqpnOmTMVRL5Fxg=; b=YEo0dEffSkzdVQkEnPP9aDrktDhpd+0oqsd+wh
	6r6tBC3ObVBF8kd62GopxCjSYxBd9M0ApRHF3/zNQgDHCjp80pZm36QGJMok8BHR
	9y+YlGBFc/kOT4qqtTniwJ6zhSxJ7nMQ6XIfw2MaeJsUaYF14APuxSdZ61t92XV2
	3XOIZxZIs1k3o/i7vhJsaViDfsqm5B3ZrN4hVb/RA2/psk798agPQNbKnWH43Vtz
	vCSmB+wvgeEu4C/8DckZzA1a7lZ7ziZcD9QqCXLLJkvDmqHgHNzcC2z9Q+8S/J7g
	9ogydZTv4wF+rJ0D3ugTwRmXWpxLBtGQYeeWofEDwzTF3VmQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvtwqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:43:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so6861015ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417438; x=1775022238; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ID/7EugR28YqfHQLTwfLSnXn67+/nqpnOmTMVRL5Fxg=;
        b=hqF+OR85MR25QLW/MTbbePSbXuotRptfcmUR2dIYDDAQA3g+aSGyRi/9MpyTM1rPgs
         hz3BjL4Nkhb9bsiO/lbyuvwrn5KCSnMcnYJ12YK+3WWmZ9GdV0bQ9mkg+qzCZJw7fNbW
         hEfHBblY7mRo8F9LLhrEdIbrPjCJmkXKtK10Y2GL0pP7wA0zoO+RTIzVqunx14puNLAi
         yBBx2FUeRUQ6dFFI2zuml2xDjbgXevEutbEXdZCy+MZy2ZdXiBs/aorjEHo4zJIVp7Aj
         FUne/56+Scm57uOuzQn9jXeosczHBubI2mO3MI8V5CBNBqwTYiwq4YXDIEMe5g9zNIx6
         rjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417438; x=1775022238;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID/7EugR28YqfHQLTwfLSnXn67+/nqpnOmTMVRL5Fxg=;
        b=Vazngs+5o2jI4e/nn2hGoLnWy5gLXAS6hCxC22Rob24dWSzZljTX55wJMQ0Bk+GZqj
         ezb/6gzJAeY+HcIy1+jWEc8q2bsd2M9V92YQR9GMWhSCaPmOA2L5k9NqMkZ7LHsQUH6p
         +OMHHXXLo84ayociE5l/ha37hq8kFnuqfRnMQUQCDYileMyNgYVLpD+I9u8+5qCVVK7q
         flyGEZ/AQwFLaIqAo0Chie0p1tAoDAJ3FTH7uMSy59jpDRzI3IAMFPOAMDXI1FRdaexY
         dAucR48l4LEp0FVkitQGSXjCrXtHzQvZwQbHyztsKirriEHGQUzRTNcW6FJWh5z5Gkvf
         hztg==
X-Forwarded-Encrypted: i=1; AJvYcCV17XgQhddgUxFjxE447QsSwVfjY2HqT/F8YqR2Of1fpt2zrOqjxqf27X2hOT9XWKUUjaarvIQ4WjiUkXfs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Mz710o13zAeSvnqz1hZAHbdoyqlbefPTcH3m6ioLNVBYklxR
	gzclZy8BPkDqYFdbF1fLOHmOYs3UFLSKAgRFECTjtY/Ri7eW0DwYQEa4urkZc2UD+p5E0rAqn+m
	V1HhazSZGdk+usXeAAPNuL/ZokNlHWBQ5KjAm0NgzUuTASts9IHA+Y8jZtqtrb3VbdWz40nZdQq
	SS
X-Gm-Gg: ATEYQzzh4QAAskuS5q/9sUbEYZVQYabLnrLDptPj92zj01KxGuHSdjDRisIwKshiJHg
	MaLEZ7Drs0tE+dR7K9t/SP9s0BIJJmTrPZp1IuiYpagWjA3aTSsSmWsfUrMo4+rgIqGjfud97nA
	vS/vxsnre2y7uDyuS5VCMWPcskv/ADokTttWWJct4Tve/Y0oqcurB9QGwnxsD+bZB2RdJdyNFyP
	/vJIClUWuQoWWROKYtQ3bhx3OgioKxqYxErckHt9p8fJE6ixd/tVRrTPe6QoVG5rnyaJDrYAKIB
	+6hrlAS6uDBLlYDBy1oZ+n4unmGqijn77xevbVge0kWK8bu+gOA0qEvSYAsMkbKJqeWifburQT7
	Tm25rGoeu5XV51FZlt2p3i8eHwFfRE19iHg9ZkRWthAdNxsxxPE+OP5OWywFzHn60CGOFd2tUOV
	IkIbH6LoMeWsLJEQ==
X-Received: by 2002:a17:902:f685:b0:2b0:5722:f89 with SMTP id d9443c01a7336-2b0a4d9b1fbmr63035755ad.7.1774417437572;
        Tue, 24 Mar 2026 22:43:57 -0700 (PDT)
X-Received: by 2002:a17:902:f685:b0:2b0:5722:f89 with SMTP id d9443c01a7336-2b0a4d9b1fbmr63035535ad.7.1774417437049;
        Tue, 24 Mar 2026 22:43:57 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:43:56 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: [PATCH v7 0/4] Add Qualcomm extended CTI support
Date: Wed, 25 Mar 2026 13:43:43 +0800
Message-Id: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA92w2kC/3WMywrCMBBFf6XM2pQ0fURd+R9SJKRTO2AbzcRQK
 fl3Y/duLpwL52zA6AkZzsUGHiMxuSWDPhRgJ7PcUdCQGZRUnaxVI3ANuAw43GwgoaXu6qNFxBN
 CVp4eR1r33LXPPBEH5z97Perf+ycUtZDCGNPVY9VWpm0ujrl8vc3Dunku80CfUvoCvMwESK8AA
 AA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=4099;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=hfNnIy09gQAwSpJazpfbAL4y9Aen7kUVg/JvfuXPoDw=;
 b=P4Jlubq3F4tt8/Su0mQVOpNpkE+VV20omltfz3xu3W51uzkHxUe654MtS2uJ34J8CmpQBAUpt
 iSFqlOfenO6Czfzxy7Q3Z/34tGMKShMlhs6dRaVFyOXAObfng12bGfz
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX+DZDa0rhARTh
 E/sPmjSd5GUtp35V9VELw3mRREDXjVyHJvV6Xa+/er/qT0KATrYB1s37JC5YVIvgN4kxzCFi5PY
 pTV6rm7/+KrV8veyT2IwSUAUtd0xMNAvudTh9v/BJowAUWseeYfixZERCkATTurb4ttQ/ewwe8+
 dxTSwvD5bi4kcOIW8Z6uYTwJkjTUoUjBuWEe39gQiP5vpRl6wtQKsrgToHWebX50O/fG/2Bns5x
 OJWr+lMbJwfztizZLcKyzEKwoPt8xS0VHw7Q5wwKcMcGjKylFXbXERHZJVraTBb67F2I8aOtfKw
 DD9gdd8Hhy88tV87WMtlrhUF203jyLgTB+8NmT03N/dLdLwc8qxv9wXJpJ7ftXYWfebxNXT03uv
 R6yOEUSQUj4LmuR1ANj3oFDgy6eyKlgyXq3uVbHDyJZt4Tx2Rtv+r91hVv0iYAGXpv+iNWGHFwd
 B7yBrvjknLadKTrao2w==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3761e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=ivfPcWm90DfOTC_Zvf4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Xsog7WjuvxhojrODMABTFBHyMztC9ON6
X-Proofpoint-GUID: Xsog7WjuvxhojrODMABTFBHyMztC9ON6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-99788-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2099331FEAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm extended CTI is a heavily parameterized version of ARM’s
CSCTI. It allows a debugger to send to trigger events to a processor or to
send a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs.

Qualcomm extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Prerequisites:
   This series depends on the following CoreSight fix:
   [PATCH v2 1/1] coresight: fix issue where coresight component has no claimtags
Link: https://lore.kernel.org/all/20251027223545.2801-2-mike.leach@linaro.org/

Changes in v7:
1. Split the extended CTI support into smaller, logically independent
   patches to improve reviewability.
2. Removed the dual offset-array based register access used in v6 for
   standard and Qualcomm CTIs. Register addressing is now unified through
   a single code path by encoding the register index together with the base
   offset and applying variant-specific translation at the final MMIO
   access point. 
3. Removed ext_reg_sel, extend the CTI sysfs interface to expose banked 
   register instances on Qualcomm CTIs only. Numbered sysfs nodes are
   hidden on standard ARM CTIs, and on Qualcomm CTIs their visibility is
   derived from nr_trig_max (32 triggers per bank), ensuring that only
   registers backed by hardware are exposed.
Link to v6 - https://lore.kernel.org/all/20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com/

Changes in v6:
1. Rename regs_idx to ext_reg_sel and add information in documentation
   file.
2. Reset CLAIMSET to zero for qcom-cti during probe.
3. Retrieve idx value under spinlock.
4. Use yearless copyright for qcom-cti.h.
Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/

Changes in v5:
1. Move common part in qcom-cti.h to coresight-cti.h.
2. Convert trigger usage fields to dynamic bitmaps and arrays.
3. Fix holes in struct cti_config to save some space.
4. Revert the previous changes related to the claim tag in
   cti_enable/disable_hw.
Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/

Changes in v4:
1. Read the DEVARCH registers to identify Qualcomm CTI.
2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
coresight_cti_reg_store() functions accordingly.
3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
Yingchao Deng (4):
      coresight: cti: Convert trigger usage fields to dynamic bitmaps and arrays
      coresight: cti: encode trigger register index in register offsets
      coresight: cti: add Qualcomm extended CTI identification and quirks
      coresight: cti: expose banked sysfs registers for Qualcomm extended CTI

 drivers/hwtracing/coresight/coresight-cti-core.c   | 114 ++++++++++++++++-----
 .../hwtracing/coresight/coresight-cti-platform.c   |  16 +--
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  75 ++++++++++++--
 drivers/hwtracing/coresight/coresight-cti.h        |  30 ++++--
 drivers/hwtracing/coresight/qcom-cti.h             |  65 ++++++++++++
 5 files changed, 247 insertions(+), 53 deletions(-)
---
base-commit: 5bca1f031b65a4a8caf700537cbbc770252af475
change-id: 20260324-extended_cti-707638ceee9e

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


