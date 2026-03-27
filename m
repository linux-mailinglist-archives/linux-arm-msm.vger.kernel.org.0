Return-Path: <linux-arm-msm+bounces-100391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAUADGW9xmnoNwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:24:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB159348495
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78BC3302513B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536D825B305;
	Fri, 27 Mar 2026 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DP/l1OL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8+HGsVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BE1175A9E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632289; cv=none; b=DxJdFqImuRRNDYRIzrx/vpEQMIlK6JLvzcUOS1Am3UbTftF/UNMDY8PjEB6d7WWoY4XuNETcioIrnVqBCPjUvCqjfypobNeag0Q9WlaZmtH+qjkPdya1sBZNnZsDUtzdq+E6gIN1LyZ6U1ZNPZhD3Yz+6G0sSa2CAlZ3nT64tdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632289; c=relaxed/simple;
	bh=knZvXDAmZKp/s8LbNvaUdOucSK6YuIG8s2o1BYDfbhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hca72IdNlNIjQdpboniQiO0KCJ5kQtJMSutKS23jovY+DeXFAujTJllFOBVb5XZvWnVDBP54CITNchsYYq8U+/waXnJfhaEE63kuud35KtGZ4I9ApAyiI6aGkVYoE+vJIbbfA4JK2n3PYgRVpA6nR/Z2iSuf7n5HQtkSvfsHjxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DP/l1OL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8+HGsVu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhIoK2769367
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxyJzStkpJcEbJkfZenz3/xq+izSJI7BIJhAfqYYo7I=; b=DP/l1OL7qdM3E+ax
	1A9V0O8p5x6DDlraMIVou6P9yHfg7+l36XCne2TtNDyAYpXMJOzEuz9fUkNscNvr
	oyR6I+soBGezrS7Px5kbJwn3NTjjU1dnjJCHX9k3NO0Gko/PD5lSCpa08R+hh4UX
	Q5bQ+FG/nfASAPWyVS6ljifuP/dUlNY7/2yn3uttxNyijpzAaf/4IhqTjAmnODHe
	EotJbV4WdDrqmHATeTX/OFfVpTs6O5U/OwM5Iol3Lk/qNfp9BCuJBz6f1AJF7fmB
	4uX7bdyo0jSbtqlevsF+CXcXQ4KoUnDALXDv3P5DkR1DpUM6VaQhzg49kUBqQM2R
	bh5RPQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv41r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 17:24:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so2235096eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774632287; x=1775237087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RxyJzStkpJcEbJkfZenz3/xq+izSJI7BIJhAfqYYo7I=;
        b=P8+HGsVuRStmvhMnVEjUObLE3rirjH5PQUjg29roENRPlJBXrs1Az43tT1v82KwQzq
         xXit9iQPRBWa6J0nXD41O2YeEIa78rd5q8kAu/V2AClgb5ScPc4D16tGDm+eJxfXRSUx
         4Bnnlf6CTSuDGQ9ukxpd8GoQxeqcLMMTI7RaG6Wi9Su6vkgY5oFGiqIUp44T//iozFw1
         8v6vrQNF0lBYjXPRz6e0uc6IbgFmjh7EVucSoKaXkSyvZe5cdhjxheWgrW6OmjgoZBfm
         8Q0OY9CWZRdGRB54nRAHcSJh7p4H++dyclQDtSp4Gu3WHgKLp7rHl7ZfqgCNbyk9n+Fk
         CQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774632287; x=1775237087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxyJzStkpJcEbJkfZenz3/xq+izSJI7BIJhAfqYYo7I=;
        b=oE5smlHmSsJhmkY+Oi8VNSTYYT8LHSHvP5G+2WC/UPwqtSSGaXIy5JVNq8e82caVvE
         McGL3a3vVfPpQkqYPSiXAamg7o9ldbk9eCG4LUXmYcCwTMUJ8d9TFTYNbK2otrtUaCSi
         WrthoqoS19SXbW9IEBcvxr6mOJLDcE5cjBQ4FuDKQApIRvYOCBFz8DKS2zV+9KDsxELB
         Nu2ZEdXDwatMnVptxJpFRjFx+w/nX9VpeqV98DtP9pWPpko1sq4+MICpzVq3rxj5m+32
         Gg4EA0vvxutb3RDzzzr9qQxPhuALR9NKABIFNpPZ3N3WNSMjZ75Lb0msolnSQH8/ueqg
         D8PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbY+woy8epmCXZv+NMrBhNYHjMv9Gs/9qyzoAD+AvsAp2QIvcQ8XGMCfZqHTl040EVaydD5sP40/ytmO8F@vger.kernel.org
X-Gm-Message-State: AOJu0YxdjAmpE6g1EWXzDklVfkZjN3zkaVgzff3iuWDJlscW/WXYN3rd
	GxGTNRoBMhP+Mr16bns6Ye2/DsOV1HN2sxoH3pAaEH2xp+rTPocQVkhD/kddbEBpJytOdo42f6M
	ffF0L4WHBPXw57ljvjAKL3ztvqcSogU72E6JCsNqaRjpXPxNJ6tVzZuQNC+y44+OoOpPi2+He0j
	Rg
X-Gm-Gg: ATEYQzz981RUcjUcsTfdvB3FSYwERlDRP07XBPi2X2X2Z2qE0xaU70+e5yi5woa/BE2
	2klUPHKz25aSbazIOqEvAaMHz+Tha/bbv2q5w19pJLyWUabA5z/i1FsNqOCHuv/2KMWqXXTia04
	JLmJ13fYQjolHpgPn/ibUT5pcrS1gr5bCI/likaABC/d0m3XRuDlo3/N/vgnkZC9j5PBlNR/3Vr
	5veOpcnyRBVs5U7mkKiR4EdFSsYkS/Gdd4lLafpzZI5FM3Emnn/pFnURqAwLg9s9LTLoL6a5tUU
	raSu5e+nW8lB8WwJFzAKSFSAHQ2fVNYGjdZi+C+KRCjrYNZfqSJwFo+v9NV6ADlRfcsS0Zldr5y
	KWn4ve4fFDEbS3DTxpn8EmLOHlx07tGLYkvXiglXhZxn9ddgB6I0KCEfCoMVGZOQn6Sjrp1eiXc
	g=
X-Received: by 2002:a05:7300:5b89:b0:2c1:1dea:c443 with SMTP id 5a478bee46e88-2c185e460a2mr1696308eec.19.1774632286592;
        Fri, 27 Mar 2026 10:24:46 -0700 (PDT)
X-Received: by 2002:a05:7300:5b89:b0:2c1:1dea:c443 with SMTP id 5a478bee46e88-2c185e460a2mr1696284eec.19.1774632285930;
        Fri, 27 Mar 2026 10:24:45 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ed9f751sm5677152eec.14.2026.03.27.10.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:24:45 -0700 (PDT)
Message-ID: <1af00780-e291-4444-88d8-bdd1acf93193@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:24:44 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Retain bootlogs that overflow
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251223170511.2277302-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251223170511.2277302-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c6bd5f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oqBJM22TPj05MoDBPk0A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: fGlVd4dW3J-sZYFeKvkMtHgH5q75RcBh
X-Proofpoint-GUID: fGlVd4dW3J-sZYFeKvkMtHgH5q75RcBh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyMCBTYWx0ZWRfX6QMqy6izan2W
 SjaaiDYBDCvSq9mfQ3zYIpVTW6jHcW5LKep8zfp29/zi6KLVq8CyqfB4xiAg6DdWqz1yESgSMwW
 8un7YhA5cWLE7aFuG8enK6htpACID0PHZThv0dRtgLY+JMn8SMjS5TyhuLCbn81Uw+es29EfQ20
 OhQ3maj05HSue38govpBc3SHo7VyIe4htag/mDS4IHAWXh4H5yvcD32IKusVmROOgj5CdwUrOpX
 khTRwr9momCiHWLuJc8bXC7q6mVrs8/nmygc162U0ZYMh4KY19JnWkHrGpsjzwBsSUwwYWSRopP
 hkCvkQ9Wv9I6hLWfdu4fFCGyWWhSTau+4c2RSIx62qJ56QUdgd0w0J6WLWv1Mi0euFGsYTgN8yG
 lmBPiRlZXL7fse0vEVLN5PAZrNMORXvbUbALRmtc1XBryMwA6QcWRyu1DMbEAEfYUT+CmD4UQg+
 obm1gALu2ubRgrhvqGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270120
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100391-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB159348495
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/23/2025 10:05 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> When a bootlog requires multiple MHI messages to transfer fully, the
> messages prior to the final message may have MHI overflow status set.
> Preserve these log messages in the accumulating bootlog. Do not treat
> overflow as an error.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

