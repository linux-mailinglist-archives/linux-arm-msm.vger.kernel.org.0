Return-Path: <linux-arm-msm+bounces-94899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPoIH357pWm6CAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:58:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E11D7F7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A2BE300B295
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C804227FD52;
	Mon,  2 Mar 2026 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psr0z3p7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RWumM6HY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8433624D5
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452728; cv=none; b=o4zEV4RQYOTts3/NQhNvgPbvSoZWO5Db+CSCBqp0JZsQvOX5+/iBJnGgoGUoQvmHnQQ5MTs3yFcRdofTmXid4N4isaIW3+eXs+qA01SD8fxPwGIJ0KROXRXYs0l95ZC/UJCsWfvZ8beeDkQvJ33uGertBO77H4QuFLdwaDLw27k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452728; c=relaxed/simple;
	bh=vVelwS9j3d0x16YfQ1vsDzk6mn5EA+6TFsXuT8/vMBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4j71bgYnN3OQa//ypyhz9QZCrMnzgUb8upr1GyCMN7rnTZonrYcpjAZ3j1GyzkZL7sD3C9HUq7YjmRmkZy4S2+YW6z7wvQ/P20lRJvlbHuJJtylX35TvLOzlDwHevjiVFoFptg9U5LSU3Z0YccAtOFXKFrgOQ030gjU6ANNNfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psr0z3p7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RWumM6HY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229Jrx53742605
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WNHECvu/6QeV24p8N9UVzc9af0Iga1Zc8PGZ6Ufnc0=; b=psr0z3p7AvzLOiTM
	j+SlRSR7fCcF8tyEj/kaQ5VfiJ3BN5mKSD2ucuqEQ4F/uS9eQInsOF71bc9dEIEi
	dLcCNHcCiAiKYOemwblI9MLozAl1mvcMd7SNi4xunW4CTy5xXz5s9f8nmURw2PpP
	tLO5POrCKbxTe2aBlPrbLlYNEYZkwXAPIG3nE8fDKRlS6/WjFEwP/WQymDC3gOi8
	Hf/3XM4+/AmV7M1P4e/VOIOrKooyXd/apgRea0onJnbHzJOTxjwZRP891/HZWCBa
	TOM5rx7KUgmGEOzuM8t1+4QnzMWzW+X131MGIq9FdqXWjEAEZTaw59b+eWBgaOti
	qj+EEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trgh6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:58:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb485c686cso388453885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772452726; x=1773057526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WNHECvu/6QeV24p8N9UVzc9af0Iga1Zc8PGZ6Ufnc0=;
        b=RWumM6HYJ5kpSfG1MCsr3HO3qtJgib/cJjaWSUUS1at7FSdnrC2kYw2hP70ZD3+REd
         pXUIGyspQgqqCcAseknrY0LiVvLPWLXWXVFioWAerbmvdf2+wOs7ah9YU+6W9u0A79fG
         vD7kKytLXzQXcqHiP4WScWXGJthqguaywi+IPRTI8c+48X1x5GNHMecI/P5xU7vbyPut
         6ocbs+Fmiqn+dxAdEC3WbuGe9d11NsPkQsrQxVo72jg8XeIGSUJ2gm9m5OIBnzqPVR4S
         8/P7F/RGocmlHkulba2eLnEWUlaR5foop7ZtCvfKy5j27ic9Ih55+1GEwt/W459SFGIK
         4zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452726; x=1773057526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WNHECvu/6QeV24p8N9UVzc9af0Iga1Zc8PGZ6Ufnc0=;
        b=KApXNOA4gsYl7xz5ZucT/h/k4TjEoxYjLHmHi4ofOyGzvZcmqxed6cub0Qp/QC679V
         1SHXJBlR1GTfACT88+c6cDDPDKRSqR3N2wkiEekENeiThnTtNp2zvDqqb7WIQTdeGeTC
         A4lji4tkv9evs2N/eW3HgvB6VsslATA0Lz2xPvyMI2aZIyAbFqCSQl6gyCMkHXMhVywZ
         X5PfsayI+3ARM4lQ5nd9a9veDiwdjxffPNVddgS7d30qtS9w9DMpuLhmkPQNa56p5Ky7
         2p3XA6iMm4Pl1RSSYyKM8A/lobl5csgBr0vKeUWJl1zgmXF6jfV7QqoC5a6EDPK5K/Pr
         yJUg==
X-Gm-Message-State: AOJu0YxNJMlP7oK4vn5lbGLvyoROUjEn7vA26BXlPK6mV8q+kLGTSxWH
	iKVBOkRDtWqPJxTsxR7omxwEm+ExzQ+9594etz0UtIRvUetJR65EeJoVsG7qupqro6HT0pvT852
	mBdl/hGgo+WGfn8F8RymlhMvHlBpO3LWG6xUP+BaEDZUt8GL9yqeHTOUbPx4pR4CwTxIH
X-Gm-Gg: ATEYQzwKqOnfxvW2kZ3zwRwQHPyKtjHr5ox5oGQHyQZXsAj8YF476F1ItJtROvlzgTZ
	4wA9ipq9zFwq6n9irD4LB/d0bX3ZVhQWgq9OiX/OEygKVojbkuMRDaWoaZ0ExibMfNB019Ijxoc
	jrUR7zPKQ2Y9PO9zBCOEQ9sqkANV+wsaDykRhjG739YBHW/yQUQGnUDUTZ4u37g/z7v+paZ6yQJ
	9C/p9uNmb6xqkSAE/EB+mQbcYqKHLXff3Q1LJNe/+5iAf/dqVCWmFhu2Du4NXXbEuMN4QrNleiT
	PDo8t3r6GmxNWR9u7YroeXXMxGupF1JZd9TxOkgLqFGzLISJxTtCQ+uL9m8fQDS+eKKOZHX8pdD
	XpgxcaVUPwI4u2savTPfcmhm191zOGr0TrDCnqOlQFshtfL/qRfZ9Qw8SbusXNu6fQCVhbK83Dq
	PDtos=
X-Received: by 2002:a05:620a:4014:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8cbc8e44f42mr959409585a.1.1772452725866;
        Mon, 02 Mar 2026 03:58:45 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8cbc8e44f42mr959407585a.1.1772452725444;
        Mon, 02 Mar 2026 03:58:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae60c16sm461969766b.38.2026.03.02.03.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:58:44 -0800 (PST)
Message-ID: <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:58:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5OSBTYWx0ZWRfX7e6j8kXPSi8+
 jPZbZ5TvuV3p82+rwDFylhdyWmVCU1CA0xcna5mbyc5JsoOyZuLnMoS0bytHxabQNt6vNSfNn1i
 oClolbt1hEpqE+X3Cnf0oqcRAQFRGEmQYQOOms6ttfx4/QGStz44C1pe7UKgDEj4BlTjmK0pG7R
 wGA645y3k2vkmvhPkx2Zp/yqIUNZe62MoI4uVArAj34eesJcf5biPtmEcfJRJLxwUSROnzs+GmA
 nhUHnLB4qglCXGHCPZYjepo/csZunTsCanvU/JMEQ14gUQ63EhHIIaIF7kDfkIYL6hebYpNWiLI
 gSolcyDga+JwwU8sSqRXvAPUcZ/1Vo1xdaWl7b1j/zeR/rVIHG0XkK4jz4GBdUbYknkQ8JGSj5R
 Q1m1LSu0yVkRTZxmrPG1eG3Rhon1pQWW/Jeey5ICcUb93TFiVL6X5ZQl9gEPta/m0xEIv8wesxY
 pRS2aMAr2XVJUvnAXxQ==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a57b76 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=plQLfFj-HSFRXCTsVOsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: yxpuHJCE5Db5pwvGstIxMc7LPy61npfC
X-Proofpoint-GUID: yxpuHJCE5Db5pwvGstIxMc7LPy61npfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94899-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B8E11D7F7A
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> question revealed that it's not actually used by the DPU driver.
> 
> There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> VBIF_NRT being used only for the offscreen rotator, a separate block
> performing writeback operation with the optional 90 degree rotation.
> This block will require a separate isntance of the DPU driver, and it is
> not supported at this point.

(in case someone interested is reading this - patches welcome!)

> The only exception to that rule is MSM8996, where VBIF_NRT has also been
> used for outputting all writeback data. The DPU driver don't support WB
> on that platform and most likely will not in the close feature.

Unfortunately, it seems that way. Fortunately, it seems like it's indeed
isolated to MSM8996.

This patchset is tearing out a lot of abstraction (which would only be
useful for that SoC though) - if someone decides to work on it, do you
think this should be effectively reverted, or should the NRT VBIF be
instantiated in some other, more locallized way?

Konrad

