Return-Path: <linux-arm-msm+bounces-100069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIZbLTIAxWlC5gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:45:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F08B3328DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F242314E537
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE1A348862;
	Thu, 26 Mar 2026 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNC3HONA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxgQvRiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77A34D395
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517775; cv=none; b=Tc2KsH9bj0X254AZjqnfM69fGVvbKhHPhyg1FXSGgtT/karLdYZEt79eD/baglRb6ngCoWyX5BU0NLr668aFmVoP3FADg7aVrWPVI0PrZ6xDaGKdn6ZPkYJvesHY7inBiG2zKYtydiMIa/j/oyYl8C3e3TT6iETDGnnEhYRjNOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517775; c=relaxed/simple;
	bh=E1/qAidL7Jabx8QKfgkv4WL/0YNnbRnF+MDmvTejXTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSEY2VqOVsXFmUf9a3biA9P5GYrV+232sNR4l7lqeQPiuWacoZIKFKdAK3s2WbPEydto0OHURK/2NOX6ZBhc+prHk5851//xmbr+dj27V+IIaLj5AS9VAUwfWabUTSNQQQ6UlUUWOjOG4T2IH+IwpWWfhzPT8IQw2fHvMqGphDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNC3HONA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxgQvRiz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q65QSJ141353
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRQhfVPZa5XOckAOSYuNxHDJKVU+H4PE5kW8js6sf2A=; b=RNC3HONApnCc0ehu
	orOu4yN+S3QQDfnq5s/hJoIrDLQUv2UOtg5gYB+Mp2n6zSE+52v/+HCJlGSdb+tJ
	0TQx9e8nVbWX/Moj9oEYpBZ0dRPaSnEnRYoetk0GUSXlrvMXlvjGV/1IxYtZpWvJ
	RtkiaPiG5ENO4rkDsLndLzgs70elT6EhaJE2/Tn6PZfYS9+O6lDHa2q7LjKqUxi+
	BVtTION4dysy7XOYqJnVnvPsfZiwLsRcnENF98qfL6o6RWkhmYk5X4PTspSsLJ1h
	KgsjzCJOZjvHuiZ5RQMqkYTPSk0TMxMOPVfzmg/9cK7aHnWAczZ/uzFnrY+8J7hr
	ls4rLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q0927pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:36:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4bd8e77dso2141101cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517770; x=1775122570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRQhfVPZa5XOckAOSYuNxHDJKVU+H4PE5kW8js6sf2A=;
        b=CxgQvRizaBxmlNpHqDI54oF0VKFE5eIFRa7lRNrKTRe29Jy5OR4bv10stmXt1Lagr8
         6HG0eLDt+bhdwMVUy1Ym49S9f34RTTXZXWGr525F8BJbTJfs/x4/zgeoLLaWCxrJ5/sn
         OjuKTAg82OUFX+TdUllOPN+zJ4Wbx84Frl+J6OniNkVmQYV1yQ64tqYL8AWtovgCGcCP
         DnLekXVIhPrcemxJ+srHUOZK8z27zYpgBlcJd+kMGSkMmDb3DtDafRNN4KJ9urTZSZFl
         sK2q0yZTt1suh9dS4dQyZGhO1OstSc1JwAs1jbtzvq1DJs8BS1a/TpX4chsAdGpSxLEx
         VDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517770; x=1775122570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRQhfVPZa5XOckAOSYuNxHDJKVU+H4PE5kW8js6sf2A=;
        b=fD6Ty1Mv+n9rHOMY6Mhg4gHycarJvm3GT6je6LIzBkn91fG07SQbPxon1YEKPFF09m
         Ubqrp5cpkP2L2bYULcopEf2HT/GfNBI1h2ld4G424jN1ku5v9k6Ry5mi7Ns2lQSPDdEg
         uy0E6bnfzfeHWyPnWE+cyqZTOmmWMNY24cr94sQsxjXe6LM8iNRtWXcSSuPgA0BKrgsk
         hnq8yJwzeITCAqQ3FgvjeeG7e6FIuuPpJCFAmjppcTKfffzRER3X0OxoPnPImo21+nmb
         /0M2acme8KVNUtok2/6dw/9pnrh2804c3lvtKjk7sCM6K63Zvh7+JAcmOp+smNIMtHMl
         2Vgw==
X-Forwarded-Encrypted: i=1; AJvYcCWxIVGQaP1xnCHwrP9khXdimm3rS/4+wZlg3J7kBTmuazgqxqXbiA9TM2lf8S/Qap86JzhiPSMohH2tYwjE@vger.kernel.org
X-Gm-Message-State: AOJu0YwPGZ5oh5w1NmFqRQu8k+q8Wu8flG8Kej8iQg7Yoddkt8W6QGZP
	XP4O/w/4Cgf3hl70rZ2/i07LHs7ZEA9o5pMsx++9oD7oSMkuLqQvRP+JzUo6LSl06rEnvf2zHTO
	74DvUWMUvVcdvOW3GPvEOSXtywaDYa0tXBhfHV/5Tk7y0fqs2pHKK9G8z9vqICzlWrcbx
X-Gm-Gg: ATEYQzzTbznbmsD+Pj9Ycz7DM7TWFyujnHYK4o+d5ZXSkFcXV0F4rP5wVRr6H1W8GAr
	8xyPCxDs29jyynxR1ZnEa2EoSw9A3bSyRmYdjfyEYtkRsSocNgJrEuXDssFhEHQottgGgSTn5Bg
	88EqBXtu52RmgtixCR1qd3ifbmg6/lEW4etzHy2dD+i3tdbDNy/iLsHeNY3+EFUFMp9UWRBqk2p
	fxNkfC8l5gXA1LgXw2K7yS2M7MmNNjqDiZoWO2UeMrlrBG7ANaXrCN38YdxtYS7Spt11SmNd7+c
	sSI1wG7W3HzHcn5W4DMT05EPAef6hyIgVmyTYIj2Hw5ekG6X3OdCO+qJAdtYmprK1g19NsNhO87
	7garLpi4rB5o7Vwfx4bZ2o+QOemYm3W6INi06PYtH3A9C72dmpuRMasK7hDyxnT/7+Q0MnAYI+J
	U9Zw4=
X-Received: by 2002:a05:622a:7288:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50b80e74102mr46237101cf.7.1774517770172;
        Thu, 26 Mar 2026 02:36:10 -0700 (PDT)
X-Received: by 2002:a05:622a:7288:b0:509:3601:cbf1 with SMTP id d75a77b69052e-50b80e74102mr46236871cf.7.1774517769650;
        Thu, 26 Mar 2026 02:36:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265120sm95130466b.16.2026.03.26.02.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:36:08 -0700 (PDT)
Message-ID: <d1c4c1fb-b6cd-4d44-8c15-1251d0f65859@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:36:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
To: guptarud@gmail.com, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com>
 <20260326-expressatt_camera_flash-v3-3-e75e5d58990f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-expressatt_camera_flash-v3-3-e75e5d58990f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c4fe0b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=uvkyEGDT79mNzstEvEcA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: yImkk3nKEH_5sIG9iz9fLlXOsXXKNNxM
X-Proofpoint-ORIG-GUID: yImkk3nKEH_5sIG9iz9fLlXOsXXKNNxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfXzgpn2/8xcLGl
 aWc8N4/vKKbsR+o5WZE5tchLaX8LNBB+R2q/8sC53t2it7ik+cU7E+pmK1ah2+vqi83pxxtNBTm
 dnIZADLXpMPiWghquAFp88+uJsR8Mnn7Jt1INIGLSinz+Zc9WzA78hA8fCe6G4lE1xETqWacFyt
 YDxVVCqilOh5YkpUgTaNliF3vkFcRe8LtgQ1j6DEQba8LoDYcUrikI7SXNgrYC14/HgR/s5PX2I
 g+8qWLGW+UzJZIRY1svNMj+DnbIWYXUIq65AXUJJXlkJcMkr7vfZgAob+2jH6igqQqFffPY2BA9
 lvtvsavC56B887tWKuC/QLY5+TkMlxiEIRsdLp87sXd1UTEkuLFSYfnT/1sfOsuleCzu5E6PNl5
 NhtDI1vAIOsQRzBdUZExAPr2vXZKvmWhoqMR7Fiqp5zTWhz3Y4p1ZusxLNnyhgYFywsTymhw3YW
 Ad0Kh5icJKQO6/zqJpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100069-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,ixit.cz:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F08B3328DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 8:57 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add camera flash support for the Samsung Galaxy Express (expressatt).
> 
> The flash IC uses a one-wire pulse-count protocol on GPIO 3, powered
> by a GPIO-controlled fixed regulator on PMIC MPP 4. The regulator is
> modeled as a regulator-fixed node and supplied to the flash IC via
> vin-supply.
> 
> Downstream references:
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
> 
> Assisted-by: Claude:claude-opus-4.6
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

IDK what to do with the AI thing, but for the change itself:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

