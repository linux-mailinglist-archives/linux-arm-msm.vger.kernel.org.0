Return-Path: <linux-arm-msm+bounces-106257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAIfEcwx/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:31:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9574E3843
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DFA33004C4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189BD33A71B;
	Thu,  7 May 2026 06:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okPBS4Wg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4ufDIbn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18BB33A03A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135347; cv=none; b=lBHzG6Mo1T0iN8Dcs7V3KfsUCm5Wk8jGGBX6NVA8dnwUN7WgIgw7qhj/raZaZ8WxRHazbT18PP56SaPx4mXQpdr/fyBdg7jFhnwzqOxWTFhUGm+bL9ZQN4tlAsZgL34JGwf6uuWwJjoEUQkrz0t2KyTG2ZKtedtZ/xqkFbKnx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135347; c=relaxed/simple;
	bh=q4n4WscZymGR+jyXhlIk0f5MOolnTwjpVYSPetxxmyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIdeZ+5RBV0QgWlSUrranDcYG4t6zOFF0XS8FeXUdBeDTDFzKbo5Pg0UamuUbC+nigC8Obo7E7XKzfMBdXYck4XqW6qEIJTIoBi8jx+Oqft5VIDUDwj6HJCvEZ0s+ns1c5ZPKq0Dp4KgV4LRdN8cwwyExvBktG1yU3dTHYCbO3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okPBS4Wg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4ufDIbn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472LCnR3463986
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MfXJtZr1BfbpzWAqkA3avZGzmWbhCTFbYqpnpL7A00=; b=okPBS4WgbSJc119L
	dmcdC9QxnO/7Q0WxFtlWr/TSF+g3Xr/faXdpBDz8RZBZrwvrJmzgm7K6EMdW/fbC
	SkviSo9rn+wm3toholzlcBi3YHsaiNM3EWITvOhKzz8JNxvHsiTjTLskQHp7l/Zb
	HPL2giqopb3EmaZ+906JKl1CSe4NESfq0MyTUN4zCkERnXlfU2FCXmsroxYG0Xaw
	bFCEQJLrLGQ4cB0/Yj+tCtXyri/EcxWs6DVv7ug2SamfJmqtxfOQcJBsn8O2ErOp
	JqxqLk81ugb8Slkb+K9xkTW0iRbGIscjTVDRlXGZPrchVFFS9w400bTY+Mwwh+ee
	nQ/k/A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn0r91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:29:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so576091a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135344; x=1778740144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MfXJtZr1BfbpzWAqkA3avZGzmWbhCTFbYqpnpL7A00=;
        b=G4ufDIbnm831HspkaPk3Zlvp7tkgzaqgsNQQcXvb7ab8oW48KzKb2RnbuODBeDcbZW
         H1ZqTMtmsn/EuLXhayGRsSI6ewaC9g9odh5E4Rp+Vai7WZBCs1sdpD6zJuJrhaVhGi1E
         1AyVHDG85kegbWG882IurAk8+ThbiFaruqFoFV6yGfudMWSP/E9o3paHKU5u4LFKT1Ux
         rU9IDDMrU9onts3gYOlzx1gzFTELbJB1v+E0tuj2tJaV5OAhQdnKGa82clA0HOh4we0M
         S+4sorFLN5/ccO3B2iFdXhQrMxYoQgcll9Fs0ARssMTX2LSwxhCXwbmjFMJDEwxf37ht
         Y3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135344; x=1778740144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MfXJtZr1BfbpzWAqkA3avZGzmWbhCTFbYqpnpL7A00=;
        b=VuK6YDdATelRDpeiClfZwCj8cQZxyr/15LHxuWQJO0gNFaXy0yqNXObNNK0dm9i7in
         1PTEFpxuJh5zEYne6LLPyLTVblrY7m2cDG78m08oHq6oyOclIuYDBeuE/d/XvGtSRYVM
         HYce2BOzREVdLJXP51UsY88+5x1wCKIX+6IFpm0ouXf/3o/nE3RwH0pTjp7iDq29cYTs
         INAzprZwA2uT4wE9HiPX3H0q5VEjvuZhEPLSYYVijc3kBzrnuDHWBK1xMiCbF6DE3M4R
         7WGF0OeZvyf2fr5Nch/kH6CGGUsJF0ocYREQOVvrvJhg44qkHT1pyIHxYoCJYAd9rl6K
         PWPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ydQIhUH7L4veMIEx63wiNB1iifIxHEHEAUBDw3WIdSLBU6wvvn7SIghxBAtNq0gaqdPgzOS8DM5lqvQLi@vger.kernel.org
X-Gm-Message-State: AOJu0YwLM/oocXzpDiz6FGKE0GG4HmNeic11Z67lb4sQA2PCYPoUBuE5
	6nQHXfnvJVvXDt6SV3VVmLztXUl+Ma6feR3VQgg8R9eBB+vk3L5i4DvsGnSymoSHGLIEor1ycmb
	QwBkLIFQm1x9oIa7CpzFm7tRo8e6rOMzurOPrp7zv6f7CNlGCEj1e2N++F37g4LHJJuGV
X-Gm-Gg: AeBDiesQ+uQOpg0nOoDKS4YGZSGbIrt2JQ8W+QUp9uZko3godkk3f9j00kc3twSbIca
	n2qe1hu3fo0J2ulo7qgsgtYArU/5ohmVPemxiUueXh/MtlnGZ9q2b1VHEz4J0fgtUyx9HTZHHtQ
	FOoCbbRNPUnQPQvt/32b53+6hggK9ABIzs6kDP5R0VuAgDFPGxq4lrgfSTeL6M3XFVdx8H4FUA1
	bwuGSHb1tqaIviFsNW0rqWNn/mjESW6AUXA7Lma7H7r2H7NY/fTbEgYSTqLp09IB4vNV/RCNWJW
	9OdbefE4nuYaBBkYNquxlSR1OOUs6BTR1MRHaLuNqVwnYdt4FgYko9PsWdOUcrUHUfXx4oO5Zab
	NnpLp9qS8g3J2eiWUEpJHXYu+5Qs4ofSxLPuPTCRX8VuBFCvnFDLIYQzwDdGMxuQSPaA=
X-Received: by 2002:a17:90b:3911:b0:364:aa5d:7d64 with SMTP id 98e67ed59e1d1-365ac270394mr6667590a91.14.1778135344448;
        Wed, 06 May 2026 23:29:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3911:b0:364:aa5d:7d64 with SMTP id 98e67ed59e1d1-365ac270394mr6667566a91.14.1778135343956;
        Wed, 06 May 2026 23:29:03 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365df289c4bsm1525252a91.3.2026.05.06.23.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 23:29:03 -0700 (PDT)
Message-ID: <2440d481-d7a2-4d52-baa6-6003b49a3f88@oss.qualcomm.com>
Date: Thu, 7 May 2026 11:58:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] media: iris: Add platform data for X1P42100
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
 <20260507-enable_iris_on_purwa-v6-3-48da505e23bf@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-enable_iris_on_purwa-v6-3-48da505e23bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MSBTYWx0ZWRfXyb3Kfy7wpaET
 wTK83SM/wKRjphiYJT8nXqv7rosGIQntskZ1fchk6ncIbACrk3v5XalTFj38ptJbC+pcdy5iMpP
 S6GiT6L1eSWhjIDn6eZAHQWWy3zeCKdVSa81tr0OHXbOngaGDsY4AZ2zim0cmELq6SDYDTCMQ6+
 kCqaZwX+LOfgDJoiVx7/SEWum7bbintmDysUyjJTIxibEqn5+ZEFbDYOCQ0gD9FA1SjJxrBYigu
 IP8TRtlVSpbnNB+TX26qwa1LKGlsjdO7tZ9p/5CbSI23usQziBe4JVpjSkgXNQDIyLe3hko4duK
 P51ddVFYH5yyD/MA2nsi0+Y6heH7niNc0QmnTytgSOCKY7Fi9mhUnbqksyoMnGwTCDZhJHF+ps8
 JiS42u72Zue6ih3EErhpnxQaHUvm+Rmp/lhY+s6Z4PyYbhKCtiAXY0Hm8g9PkwwqOP2/1GVe17l
 inchDf5BOjV13EGNPAA==
X-Proofpoint-ORIG-GUID: 3kxInnjXT2eml2iUoPHSdrPQHLZJiNNZ
X-Proofpoint-GUID: 3kxInnjXT2eml2iUoPHSdrPQHLZJiNNZ
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc3131 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BKLBf-2C27FvE5_AC5EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070061
X-Rspamd-Queue-Id: 9C9574E3843
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-106257-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 11:35 AM, Wangao Wang wrote:
> Introduce platform data for X1P42100, derived from SM8550 but using a
> different clock configuration and a dedicated OPP setup.
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 103 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_x1p42100.h    |  22 +++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   4 files changed, 130 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


