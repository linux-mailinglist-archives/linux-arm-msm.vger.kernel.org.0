Return-Path: <linux-arm-msm+bounces-99246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAt7D1c6wWn2RgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:04:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C23E22F2741
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B0D030053D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33CC3A5E73;
	Mon, 23 Mar 2026 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZmiaQgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KG+vIgp/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F9536EAB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270561; cv=none; b=HgaBDhnkUbFEZ/jf+5Dgwh3vCaOffCxmJm2GX6U5Lfk+Peon0f83Z0t9xKToorNHRGKIdP7GO9DGu3RhjMJUwuO/cn1DkLmyOzC7jX8bv/+4BFzOjUvxRB257Igf3tQILLqSJLPoowxe0HFLoNNC+cRDhX3Xb18pQX3+FeMMgAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270561; c=relaxed/simple;
	bh=XZmcl7C7XtUYL8BqnUMMdt6SmMs7aEtVdCXcv6D9UrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhRpiYjXs7yCffh9g/S8BAbPouhos7qv5obX4e9bb3KoZ9utGWCbzZ5uzI3RqGTYWvHwhu5yk9ZmdeT/Ei0NWatJTasULpG7njIjjMfYAKrmvdl6v5K3fjsP7BDELgNLBDlF8yAQrxbqwTGooIMe+g/N+TN5AMRi99xXUDBCtLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZmiaQgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KG+vIgp/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7H8L61301211
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YK93z+qtexojF/sQzMohye/zyPAnplv9XAS1tCBDwZI=; b=PZmiaQgoaSE7SkXu
	vTWJmTkZlKVJh4LYVgQiJSMru93qVYmeV0PUyuT6gRF+i4fyC979kY5DFaVFOZwc
	1sBssrMYb7f4okCQ/elCoyV8afpROpzg5eL7/wvZTF7BZEEeMjSbIEXOZ7WRTbSr
	UuCFShAOC/cIQlI/3OURIxgWldXN/jMPOl6u0mQnEjtilfi+y8L8Upj25KxGY2nB
	VxfhE35+UShrjlD8WQDwcABEslS4pdpA2hFKAzHkW+dWNoVt1thcov54UcGI485a
	FyGeaeeSyCSgkDD/7N0YOQR96YiE9sexxdoSDDUHrxoG3Q+TAArGComu4UmUw0aV
	QkZpMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghd9r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:56:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31f391b8so25888631cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270559; x=1774875359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YK93z+qtexojF/sQzMohye/zyPAnplv9XAS1tCBDwZI=;
        b=KG+vIgp/4ZkogLtj72glW1xs7Z63Ccxo5Wh/o3AEc/L4CNMwR3j3A5sV59co/OZTk9
         SFuwdpQLpsalasfG2GBmE2zofgRVEyyPszyrQmjNqlHDsExyRWmKa2JFAdSbX7ulvBoq
         v5uz+kZruf6SjspwoCd1sg2fEgL4zzMjfH+UoO0XGLFYjfzc0L1pXifpTJRSJnackqj4
         qDziGp6/aw4mRYx1WeoxfPbEXcMccSjkv31UyAGmQSdPttKGFxBCBdlXoyTK66TLl6NI
         I5o7kOD7pOp2DH3EuVvNnNqTKSU9lrOQ2XYq0eGe7XVx1CG9uMug/TfcfvnL1Gyd5Wjq
         9LCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270559; x=1774875359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YK93z+qtexojF/sQzMohye/zyPAnplv9XAS1tCBDwZI=;
        b=Z809wxnLngwJBeplFA4+y/B/H8FZQ6WOS7U1nJdclxywgAeLxPYk+7/APWSBq0kIFy
         hRnQhNPOMNg0NFgtTvCbjPHtwQdsfsF+t/q0oF8hPcOZBd2CgmMP93QHoW2LOCaUOkaA
         gtwZSndKyxaq5/Z+EgMcbkwohCBpkPZzZ/ELw5ToZ7TWW85LV2naOMUAtQ+pw9YkJF51
         ArukY6WqC163qAorFCgp4Hz0kvIXSrIwkDINrGs0sRoQFZvbntCciUylWiD79I8cuH+3
         IO59nDKU7KO1+OqhzUEn+VWDnGne/seWt9hNHR9EsUPNujZHhBS9clDpcZN7N5NT1hfW
         G83g==
X-Gm-Message-State: AOJu0YwswfAfXBho9gQmbnJQYU+6k/9DMqgnqAhNlpdO6PH7RMMWe0J1
	u5CqIX9c1ucV2rkU3WhR+iW6AOErA+YENT/ehAyz7ejTNxNjB/8I4Cd9J6HYbsp1+O7TSlnvW3g
	0cjhMoBbd8tO54N7BqE+IRSYraDNP5caOVSKcuhSzoCceZcph7vJjpwECiZzSBYceZLX0
X-Gm-Gg: ATEYQzyUr1IMgXGxmteWW/841eoYzzPkjSZQexR37U8S+ixOylLMaSBtLDyd+O/O02w
	Agcdxz44X0p3VKUeENNd5JorjOjiLE8ztaPwz3EYV4mRKxabGOSNkIrOajJH7nXX0rh3+NHVFgr
	MhhNDBj6qc963UgZ+bGKLgquFJKPf1m2lZxUyOGaBNw19qsbICXSWDVRk9IRThis/rqBMTOTtkT
	9wfunqX7X0ASOnX6qkmHNH68KDOHJCbl3BEvdHX+lSPQ3ykoIk9YbavOCoCrtdjZGq3l4xDYFIj
	rj1pp1AjWBPC7i0UD2JE85Tt52xJJx/X34eDxl7CuoTEC4n1Qb+w9SwNX2/iCrYKH0Dt9WL2jey
	NkzDUOvhHHBcV4zJNW8YHRsJ3hvtg2vkpVRucHtroY16fJE1Zx9sl49+0D/Z0PcGWonhQ0MGeIX
	HmBSE=
X-Received: by 2002:a05:622a:188e:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b37564ed4mr144788711cf.5.1774270559230;
        Mon, 23 Mar 2026 05:55:59 -0700 (PDT)
X-Received: by 2002:a05:622a:188e:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b37564ed4mr144788361cf.5.1774270558773;
        Mon, 23 Mar 2026 05:55:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cd050c4esm3679893a12.0.2026.03.23.05.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:55:57 -0700 (PDT)
Message-ID: <0794b29b-b999-47b8-a563-b29fa33a54f2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:55:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Enable UFS
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20260323-purwa-ufs-v2-1-58fb2c168786@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-purwa-ufs-v2-1-58fb2c168786@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c13860 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aHjQBcVEZvKKP3e68BUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -FBJC4qD3upnMA57Fvduls7yiEUgYCrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX7HJGvDW70RrC
 wIBl4e27RqEMS2gOeKAXhJAyAzODbOVL0kCqkm8vxqB8E9JsCiLxaH8pOEFLLOHzXh3Nz9lbQxn
 pSDkiSVKzjaYHWq9XJ9qhHOVsfAzZRcBm4WvXwdN7oxHKY+yiemrBN+ialpf330My3ekVGqpUtz
 oRtgTka2KQ/eVdccBMN+J/PfAEjfhCoG5kXWFKcoI2kjmhO/8gSrdstSSLndY2PuhaW4KM429WD
 mrOH2bW7X1nUkgQvX4fmEq3lbro96slRsXmaNg3Kjh9lSbMJOXQrI+mNUMF8ynH39mD5P6Ly6DZ
 ZnWGmntqJgljA2VA0y4CD3iQdFttq9NaWuK5s7j/mKfNYOyyBN7cPAODqfY2w5EspKvnNIYyMmN
 AS2z/xIViZIJWANiHZzCsw4XvBTY14htq2dqiXIntveBTmtNoRMDIuMQ4gNW5tDgkWgQY7WlPp3
 5/JXFBMbmjAd/PpeSIA==
X-Proofpoint-GUID: -FBJC4qD3upnMA57Fvduls7yiEUgYCrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-99246-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C23E22F2741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 1:47 PM, Pradeep P V K wrote:
> Enable UFS for purwa-iot-evk board.
> 
> This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
> nodes for x1e80100 SoC
> https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/

This information should live below the --- line (in the ""cover letter""
for this single-patch case), as we don't really care about that once it
hits the git history

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

