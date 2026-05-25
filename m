Return-Path: <linux-arm-msm+bounces-109641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMHlFu42FGpuKwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:47:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA605CA296
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9DFF30041FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F093370E4;
	Mon, 25 May 2026 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfWmbTS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/gJc6Cw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8639932B119
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709674; cv=none; b=cuM+qCj0tc0XemUWKa9V+Q11ntKWffJ854qTydAQ4gmKFOCBKNPAMndP8fSr9DpYdgtTHbwxs0RJgGbaiCHtDDeHyoR9YL6VPIXcNjq0YOfC0GXD82jOT/1dblVQwjtLu0gyPoTasmRFLi83yotSvDwyg12lS2HIZwbWKUC7Q3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709674; c=relaxed/simple;
	bh=8+N5QED5VEX+jyCNs4ib2nwfE4R2izQhQjXVzDqzl3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FFyPVwHHXlkypF5SIvJ2BoOiv/sXUwy5nXX7t/lOprf2S7MP+8YQwwRkhFWq45tO5CR2OpkOacT6kcDuILW47ViiEBMtfyOieGtBLcekXBx2CXtA5B8C/q/6VZEEUqRWG7ITg5yb4HYIqiOPdcIlIzEhVYKjjgwecYXiV81Glck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfWmbTS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/gJc6Cw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7SuZo961954
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9Ij8IFe8zJbhUKC3RaO1er06yyOOiN/I6II
	mtMmgKZY=; b=dfWmbTS/It8D14GsCfpcr/5+9F7SIJxVm088dRPJ6pb4PKxsZMW
	FNDw//GDK/vx6w08C+kqGt4PAmkhJ9vIIww4kP/kDHaJdlum1Ed5yQrfUG58ZI7W
	LnnXC5JL52cMHmOjb0FNSeRH1NvfsmjKc1JHLEc2yGKXOF2qcYEF+GjnPsHl/i78
	SFbImFv+O4MWQYPMpxzWWnSe2ddfkhL0adnT7B2A21AaQbrnv59VFZPWSmiu33fe
	TsFaOYr3Kr2//c9EZkgIA/2bqHJq6IxMaWxwH4CIrKd4bncWQZ1LL0auw1mweU9Z
	Sz05gYFoosA/m4+wKXoOMTZ+uqH2y2mbA8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3eeu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:47:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51650041428so40128011cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779709672; x=1780314472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ij8IFe8zJbhUKC3RaO1er06yyOOiN/I6IImtMmgKZY=;
        b=D/gJc6Cwnrdwld5RmmEsCTPtjS4Ponuf5dO9LfiX6goZ2FsC3RazthRs6bonO7VwBn
         I+iG0TdotxT7OKjOhFVz0vPDSvII3JrfpdANiiC5Nn2IyXALnr+KIsJRMS11TEH5YcWh
         LbuzfuAYyjbR4jDRYqNR3SPZAc27slkyz5seaxdp+PI0HgncqKCmeG61fKuvkOU6NIiB
         A7xARJrGyHBICZpAN1nMtuE2gcZXhtk8Nxv+vuj1bPmPzTtCQmE/9SntiLrfPn678CzM
         GlxBCy85YRQe3k+0XUlohSZQoR7VAhdgnlOlYSYxb6I1xsi40H7V5e1/mWAlBrwZyE3h
         RHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779709672; x=1780314472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ij8IFe8zJbhUKC3RaO1er06yyOOiN/I6IImtMmgKZY=;
        b=YR7PuCNe6h0DwGEXliLkPc6LO/Mja+EiloBL7vgpaA9c/O16Y6Au3c5CMb3iV5S6To
         MCaL50m1EHZWQf7rIWvsfyKsioAfEaUAvHYvfrac56OFx41yIbT6tnX+ZAu3xhTiDA7S
         0eJfCDU0TUOTA3PM/TuKg4uz3RVo50H0M32DVFoHY7c2w9PGDXlOHOsusF+Qhps4AcHU
         OjHh/kwaD9V07am57PUCGRYro3dzwgDdgrLkNRtzdBx8Yalom2TWEXRqtI9k8o2P+2w5
         D7Vie/8pI97kP/oDgJNO3UQwL7asp6LXzrPFLRpWDiHtiProKxxUlBzBKstPtP7+BfWO
         xKfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+WFCP/tfyUkeDjVu9c/G847RkAERRTuviM9V+u8Y4p6Xor3QL81ljvtrvymcwwtjtg2GDEzWp/2Wje2W1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjqy8WpUeh9QnT1YOCHg3GUsBRrIFK8zsZmuAuIFtHUBxHGfqL
	hyYzZ+0kIUlQLfFh72M0ZrSWzakf930V4P8Y9xNgR9SPR/dGoS6KGea03D0+/jrUc12KRRgF4fr
	ElSkcMSOAzgAM+aSdheEz7Ix3B7tLYF6m2kjbnr+CNCx56VX4dMlIrpDFulgA5vGA+oRZ
X-Gm-Gg: Acq92OF1PwCh/5vnvcgXAVoTh4HHDk+Myl9h1JFFbOFT8BJMfOavTIPRKvWejlG2Fv3
	GbJhna4vCan6llSdyQmqcDhnEIgjWKjHrZf6c8KbfmxwjO+kygUA4FVCKHRN7fgOAVnLdEIWXRY
	PZfCqLvqNb9lNRbJL7Rg8TRE74iosAAUjiysduQ0+doX4jkjFqgb2fy3PQ5ryd+a8WfuIPgq3nM
	OD9JhkHlKj5VLdpopkhjzGaM0yo52Ax5Z0X2XHYRZC4hUT6ug8Gk4yUWBa1XH8dShzbRd0NXU2A
	VZRD83m0fTaez+KS+2ks42zSWuisG2/5cQYAUeeDojFxFGc+ijOk8v75AjyZvuWyv2oFnmX7MHR
	w03F54/tnFEYy5MLgnDq6XcOvieEZMSQFYGkFhUhwKovBRRulltzORZQ7yMoZYT5cFtGwoNgF+0
	nk86HnFvNToB2s448dPma/9EkoS6QkFBY6
X-Received: by 2002:ac8:5e10:0:b0:50d:edcd:4f39 with SMTP id d75a77b69052e-516d467d82cmr193557571cf.40.1779709671879;
        Mon, 25 May 2026 04:47:51 -0700 (PDT)
X-Received: by 2002:ac8:5e10:0:b0:50d:edcd:4f39 with SMTP id d75a77b69052e-516d467d82cmr193557271cf.40.1779709671515;
        Mon, 25 May 2026 04:47:51 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc66dd3efsm384096666b.58.2026.05.25.04.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:47:50 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: hamoa: reserved-memory changes
Date: Mon, 25 May 2026 13:47:47 +0200
Message-ID: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9J3-gI4Ml4Rub4mUe6d77cONrZx8d-Lh
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a1436e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=cqqGCi8gh-Ng8vU-sSMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyMiBTYWx0ZWRfXzGPjTmSyzsmp
 a0X8OBLfXzHxEILutOpsjXgEaaMg+rDdT+j3emQ8mQrN/dJyj0DACE+FvOZWgIOtMSBt04IFwjJ
 ZgvgRvY6KVlHStRGiqTMIsiFwYsBQ/WLXGuJsxtJinnR/cD804HxKn43rUFGCVWckJz+ydvUIy5
 XS/2fZQuRWjxWGPhVbivNiepSjrKJtOf1pUMqGZIAHYVWPb6HglSPBdkZQLlgUvIfNbpHejrzsg
 mZ+ernT02mKbhjvc9lg4qzNr1OmOsDPT1HBRko/sladtHDWmOkCQCEiVw6yxGtRQS9a4QkvdX4Z
 R30yl6/W2XA1vOHT0ZQoW2MSg6OsdMcSyuzRGbIETRYQlZHEDbiN1qthDhYHpNY8LjY1Oh7wHUe
 jbZxqIz7MygxrHmN9wjuNwGLg8lUAs8kLiHiehHDsgOnNhi1YVtKdNoljAXjOG4jIUABV4lr+m3
 GJ8WBe1almLyonB/gqQ==
X-Proofpoint-GUID: 9J3-gI4Ml4Rub4mUe6d77cONrZx8d-Lh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250122
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109641-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECA605CA296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

Here are 2 patches to hamoa.dtsi's reserved-memory node:

1. A bug fix fixing the length of xbl_tmp_buffer_mem
2. A patch removing a bunch of memory reservations which are already
   reserved by the EFI memtable and which are otherwise unused.

2. Is marked as RFC because I'm not sure if this is a good idea, but if
the reservations are already handled by the EFI memtable it seems best
to me to just let the EFI firmware handle these.

Regards,

Hans


Hans de Goede (2):
  arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
  arm64: dts: qcom: hamoa: Remove mem-reservations which are already
    covered by EFI

 arch/arm64/boot/dts/qcom/hamoa.dtsi | 60 -----------------------------
 1 file changed, 60 deletions(-)

-- 
2.54.0


