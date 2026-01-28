Return-Path: <linux-arm-msm+bounces-91023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFDLMdMGemlE1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:53:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E175A19F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6411C303746D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576CA350A2B;
	Wed, 28 Jan 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5wTO0wR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nszg0aTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B4350A10
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604633; cv=none; b=kCDZOazGcCx/b2AZBwBG4uwlBc5+qeNPA9fYXc6nhto/zOnlAXQyfSfF5OKT2JZz1oxE445GyQKIBzwTKcQ3DKBEjs+weIYcdHBfdSWrr4SiNhU3sNq0W7vqG5znhVe+2jZLU3Vk37Xek45uNaaa9FASjKjhk4QUwJc2FcPvqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604633; c=relaxed/simple;
	bh=x05EH6IoJ4/iyPVoHvPoWf1Qp32Y7RrlJkeIkp9TeHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGjqBLAz99Xrn4ulVkM+BL4iCYOvt+aZWv3bSFJO4DqzjS7WdWq/WF0VmWA9Z0+lA/4mRwSBZHljl8lq2hSokuk9YcwX/sYzMux3vtxNg7zSzxZOT2S3MOzs2TNbRp7ArOFuwxZwunwy1xrSIR3OtjMOA1OsJ/KpmtUwFcLNI2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5wTO0wR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nszg0aTk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92DNt3387376
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmPSdwD92PL71U20ccvuz7Jt/7HoYLnD/OdLvqYMNuk=; b=g5wTO0wRn1gZ2jRz
	t6FTaG7ilZ0rny3Z3eWEMa95C4Blpfp+jz0dsiLL/O8aklgUGoNJUWBTgPnMzXi7
	tSf+/q1SJiAqq3ksReO7xhvXkJD9g4rKcbr/m06vSQw11GkEXxg76rAMbnriMtv7
	fXp22kVbFZSAMNzO4qYmbe4Dp1xFtzvPDTNED5Cv3k1g8wzS+NYdU+w202vmXB6C
	0pniWoT1E1aeXlEBO6JRVo6yyI+eVKr45SlYFoMUS79o0HOUzaVy1ZlrI0W8AO07
	plXVkY0OqCUe1VX7Tvxw4yCpb3mHAMhXB3BkhYrA7o1palCaldshoDbDtPUjpEBt
	n73WVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1dfuhxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:50:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a871c32cdbso20256365ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769604629; x=1770209429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmPSdwD92PL71U20ccvuz7Jt/7HoYLnD/OdLvqYMNuk=;
        b=Nszg0aTk7vjSLbqcd3qqetyjLJ9hAj0AncZ0O8rnDZKv20X4bGank7bEzhGfCL3VrJ
         FaU6HjLWI8XPF81dfSVAkZTFDecHsDM2kThYFn0H1iVAXt5USHe3GQVCASaX4kAhUU6g
         DYrsi35G3R53iT/HXTxQRj87wYS1SSfPVv8JnQ8uWlcG8GKoWrFd59opet0VXln49ESs
         hD0olo5aEquZYFY7whiVZRNok0UQJuot9ibbDQpvb22YbDxMG8Q1cE/RjLse2HkGojwF
         l39gkaviV449uc3LvBiIAOsJ8bEgkCM43OzjwZwhyxn+ZXqcWb5wSHN2XwrXZ5KpKIVd
         nkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769604629; x=1770209429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmPSdwD92PL71U20ccvuz7Jt/7HoYLnD/OdLvqYMNuk=;
        b=A0hNoeQcmfdHgoUBK4Pa7t/cP9bd3mpEsL92p4WDzkQYw5iTkqeIPIvZS2n3QC+K2R
         vKHy0JJz0hZU4/yFaQolqSkFTOuuyJwHvlQcFUiBvppIFeVAIWFV/KgbBSWpAiEV2+l0
         vuoM67ktVFOA5lZ0At+IuYWVqN5TR92+ZoHGh/3FaPZ/rqF5MQ6w56Gc5bG6Jl2r1b9w
         hCF4vRbQdFVSorzvAM9wbeWuqYoYLzIv8li5mdomkRSvn0yEue0NB/KuxxGznvGeiuj9
         +eKloC5icL6G2R9WXfQhkqrmFSnuxLm3pWGLkdUzfWjD/1abVpeEkRZXNFfH8Ht83KC6
         hgCw==
X-Forwarded-Encrypted: i=1; AJvYcCX0qowdzLuJTnRDx4+isIhKsCb7SE3jEjxH60h9NwGKlMsZ79AdMOqrQBYhWGOVHS30IbL3nSV9mDsxLn9s@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/f3rWb+HHNvWdWWvkesdmfj3WpCTJL8+8Fgz01dzw0mwuwlf
	rswIiykWQk3JxbohdQM2zmX1ZMPIntA0mzpI5Vw35XGVmEp4KdPRsYrccTh1sh1h38rBWWvQjA9
	FHjCVBc9LXk7deekljqEkMbDDKDL1KKbMPvcNINIQF1m5I0qd4Kp0BEbBveKgS65jdji0
X-Gm-Gg: AZuq6aKHLcFn/AXqEvsXY8WII1MRvkFATtqOyfr9Lf/42iRaa3d/IbckjQ1n43mUX2O
	KKLStjswUe9YYRfhPta3ESc2ZYgKM0x1OpFFtToG3QmksWabYBqwtQ62S1Po4nZxWapGm/uZxVC
	5RJMOLyMdfceWPTHpaNCxalu9Q9c2JVTes6ePM8rJ8o/aOE9kLnVghTC3YAsa5TfRiA/aakV5s5
	38CjfN+paH2QsBMHPyZm0ntbow/5m6XrM6y3Gu+zZC0eD2C0sOkFkfImJwhDjm97foDsOy2qaS0
	yq1en6C47K+4SnQcPIhgf+tF3YJ5k7YBg5+EvdD1mqI3vm8on25JiObl0YzCPZ1UYxLPxaYImD+
	jSGLPNL8oDXYFOz1WXHw/uo2VxIXLwiQrREuWddeax1U=
X-Received: by 2002:a17:903:2a84:b0:2a1:4c31:333 with SMTP id d9443c01a7336-2a870d645demr52336525ad.19.1769604629330;
        Wed, 28 Jan 2026 04:50:29 -0800 (PST)
X-Received: by 2002:a17:903:2a84:b0:2a1:4c31:333 with SMTP id d9443c01a7336-2a870d645demr52336285ad.19.1769604628714;
        Wed, 28 Jan 2026 04:50:28 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d4csm23365005ad.56.2026.01.28.04.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:50:28 -0800 (PST)
Message-ID: <a902c741-bc74-49a9-bf09-070ba7b5adb7@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 18:20:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <20260127-venus-iris-flip-switch-v3-3-7f37689f4b39@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-3-7f37689f4b39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwNSBTYWx0ZWRfX9GNV/hsdWVQY
 y2RXtulyY+Nxg9wHOqqhYbbGQKGt2rPtFhqTe7YuM3FXG++YgVuNiaRiB6OYR8SLsxh1aookLD1
 FBwS0q2Odfp3W0FQTt5btE1WE3qNUCIOYOkIf67cr0H+rzOmdISv3yB0C+ay/p8q1TRzQQ6RasT
 V0lChj/S1J+ajns8LzUIja349vwTj0l5u0rAaHutwuV2ASw6L7KElxeKjioDQol3DTZdB45N9mU
 S+ClrHIWCY8hRL9ICJanunGjP9mHUZz/f5q39bwzt4hraEipZzxP40IPm03QhShU1f6ydv9CrUm
 cmKiPweumZI0ziF7Kdh6bhKnw87CNHTMECDSig3gb57E26AHfDvN30bzglXcatnPWvyo59mLJ1M
 llILohbSj03h94pYb8aHDJvoWawOBu9gUdrjgo7EBjCvAA74V4SP00ABNxj+ILoSeYAm5fNlY0D
 3S1P7lwBXg7kztndzpQ==
X-Proofpoint-GUID: m6ZqKGcGPoDwgVNof_SR7BBDCHO5C1uc
X-Proofpoint-ORIG-GUID: m6ZqKGcGPoDwgVNof_SR7BBDCHO5C1uc
X-Authority-Analysis: v=2.4 cv=YeuwJgRf c=1 sm=1 tr=0 ts=697a0616 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4hJEjaH6g9CgPEswoao2AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=taCg-2STDlqsnU512KsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-91023-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E175A19F5
X-Rspamd-Action: no action


On 1/27/2026 5:53 PM, Dmitry Baryshkov wrote:
> As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
> uses the video-firmware subnode, move its definition from the common
> schema to the SC7180-specific one.
> 
> These properties do not accurately describe the hardware.  Future
> platforms that are going to support non-TZ setup will use different
> semantics and different DT ABI (using the iommu-map property).
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

