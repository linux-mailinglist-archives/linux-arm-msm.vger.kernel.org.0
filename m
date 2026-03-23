Return-Path: <linux-arm-msm+bounces-99275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOObFglBwWmeRwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:32:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A81482F2FB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56E9730624A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9583AA51B;
	Mon, 23 Mar 2026 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0NihRRz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OX/PgeFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B73AB289
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272263; cv=none; b=WPYj90LZA6INfpJmJyainD0urM5Jmd3sYtDQO54T4o0zjPpKxCZMOzOXIHNHjHWtksHCHbSGg2yNB7lVcFCsBfl3NJZFpuGiDXOIJbfha4rhWlS9vQlterdA12Jw89jgxUtmryi5KiO0nrIlSotQY8eZ3ZN+chutsCjEszk+7s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272263; c=relaxed/simple;
	bh=ejIqjgFxGi7fu7+NbT+MIv4xGCb4y47TzhECUTKiMMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ur3djRrHeyqLKRKZlKDO1CpjLC7XdrkmEYeyx+beJGF+o6hgAeR41sG2hZUefzongqRPNDNFNe7JAAd7dd3JimtHb7er6aeg8oie7mH5pXgq1gl/vKVBJIcCaQ7RxWUUIFqg7bfnKJNfhXOwC4YmT0I+uAqcfWY9Ad+28bp4bjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0NihRRz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OX/PgeFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ND7YHI2191173
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOpdTUOG5Rny+ZgqmmFytRsPX88FDaNd3QT2swih8XA=; b=Q0NihRRzS4JUb3oS
	JrgRJL394cW19M2qk/o5xSLJ8JKkYjzVDWN9DhRcW60rxs48xA5LQRKcqb7oyDBc
	mjMVpIVcRyFW6JAmvQ3szyzSO1MOjIjGuuB1lrP7P1hLUElYa5y7P5lRy2V//4Wt
	XK8awObFuFVTy0pdX//Nk1Ij62V+iYh8snjGlb3hbk3eeXbHWza03kK4ejWEo7Yq
	XOfL3otF/7/eBTwGGr+2UhT4CcUJ8mUIxrv+apm9+bKDPYbMYprbOfSfOoh9FnPA
	8d53M7ZOht1wa66wb84PYQy0VE4WkL/iePls38TOIEeaP8L3BupUUGWqz79biclb
	TzRpRw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jr33g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:24:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a73ec7290so1623971b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272261; x=1774877061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOpdTUOG5Rny+ZgqmmFytRsPX88FDaNd3QT2swih8XA=;
        b=OX/PgeFV915pNT98KvyBEPW6X6+QIhLjF66DMkd2wj94k1w5cZsKy0IGMsvTuDAHCZ
         7DpZJ7yTYN0iD8O1StCgdAVANlP9q5WSuhrP7XNPYruJDI8buahtLc2q6O9I11+feebf
         XZTGEjhN68kE+3QL7P/skHg6Sr+Mx3wbe6uazkI4noblzJcW820L1nyoPxjEoBZ/edAi
         upy6VC16HwFn1flva4htYv43OuG3BNB1RVNF30WjnHACxMLMK2pqRV3RaABpCdK930iQ
         QiK5H4TkE46ATM5Nt+7yB0P3+nnH614v8shGcW4MJJ0jbtSxfDCMfFCnA9spBWGM3+t0
         po/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272261; x=1774877061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOpdTUOG5Rny+ZgqmmFytRsPX88FDaNd3QT2swih8XA=;
        b=Zf2BHrS/fWKkHmdQMpyFaEafZ0jsHHCcyBuXz3Xd0zL7BC6WIniJm9aablQrK20QWF
         8SNXsY9ueGuMGK3pSlHoRJ6xIKM3EiGjHjuLNgCe1q/O53QnR5x/zDNWsEcaiE6io1Jp
         /3D1FhI/gJsluPRk1Y1a9fGIaGl3Vch5R01ujQ9o6iry1b6gvOqSBqBNV4AMILhY1GZH
         fsWjo/kZi0NCqqYH7AYVukQxPR5i9HrxR8ldnbWtURZR753xLhUuD58yi8uuxPd/Pz6f
         BeFuRvLyM80FIzY5UGeVHDwvxIJ1Exec6WhwQg5OGs4VFv1DYLYtgTHUzueLh8Jrt2mq
         hEpA==
X-Gm-Message-State: AOJu0Ywr3KGLTjuRNfvRHqR1OTIH9mmita/35A8JEt3qHPTCuZAzlSPg
	UcRfTDvJdGg/dhH3hWaZxsBwWtUJWH3oqzd5r2Shc1gOxC5Oj3ErtfNg1EOxrEXTqd/g7AtHSNc
	RNBRq7NLY1rhuhLzJCTM8O3VC855PHZ/aaWDvEZCOkrIzkrrO6VLflLujv1Z5sA+ZXo0U
X-Gm-Gg: ATEYQzz9MPbq2dY9FaqE0XFxtIvexjEHQc0i6RHygnXuCVhggQ9uwMy3c+1EbTDQOOc
	fbwXQZFOKFRy4hpwcsr06sDfGS8irDcG8xTVdN+vdeYPQ6kdSmtVkapDZYT6bT91jtZ/ypKGwgh
	1kEolhHC6ym0d0HrY0ipV+CpNk7k7uxgZXej3mY/XYH+59aAaj51ZxZa7V/DLWsbKF5Hpo8SPXv
	54k2qIt+/O8KqPzzcYpFPKh4DmvKrkWvJPc0tLYpvfAFDebMmC3HK4r75Vf+VHlCgqkXdL3S1dW
	FCV/CDk0okLajFQSdEzozAdOdKsCzpY8ZyIIrXk8Za34NzSfMqYvs22Wjl10H27yOzR5pd4SBUj
	b7NFJ6HURLsyZ7231isA4PAMNHBubX6x34J3AsXsytRKPcDn83hF8mI5vXN6DagE=
X-Received: by 2002:a05:6a00:9505:b0:82a:7f6b:3fa6 with SMTP id d2e1a72fcca58-82a8c398098mr9176566b3a.52.1774272260759;
        Mon, 23 Mar 2026 06:24:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:9505:b0:82a:7f6b:3fa6 with SMTP id d2e1a72fcca58-82a8c398098mr9176549b3a.52.1774272260275;
        Mon, 23 Mar 2026 06:24:20 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6745sm9792648b3a.23.2026.03.23.06.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 06:24:19 -0700 (PDT)
Message-ID: <4ebca960-93bd-452b-a6e8-536223006991@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 18:54:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Enable UFS
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <0794b29b-b999-47b8-a563-b29fa33a54f2@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <0794b29b-b999-47b8-a563-b29fa33a54f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Md97ktFXsek2S7S1Id_DCIykckqpEJaL
X-Proofpoint-ORIG-GUID: Md97ktFXsek2S7S1Id_DCIykckqpEJaL
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c13f05 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w3AsEPM0cKjnORHfOHIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfXym2auyCHo5SR
 xyRfLrgvJbwYp4v0J+0crDdNgID8ajUQSjUTvA2bJ+708QhyDMzELjifw2fLskMQo6GazORbSwR
 tcbINeoLn0ZqdiFWje8lTOfon50ri0udQ0Zshtv5p+tfalq33LBYCnoy+ZIKCXS78PWCK87IwC5
 ULTxOn0iw8ylYPN2XKb/2aR0b1+OeacGp6bDJNtWnBQd09Hb0fomxTiAJDyQVdcnBu9COC3c21D
 06g+WU0E9rPRS5Q4JTlcLFoGptXvlJfvH9XqUUsa1JB0sUeCwkxD/I/j6zfq0j2B6z8AFgJ85tP
 S1MWUKP4w7MvMTnAdsUA4lXyzpRRbTWef6wxqw8hgRb15IVhCgXPnhbTbN3HuDNSNfaAcCO4eL/
 X0C4ozA2gCEGW46LsZn07PcnWBnQ7TDjl8GtA50zVA1KTX8bD6Lu67NwLBD0DbAca1S9QIhCYwx
 B0I7D9v6/v/c1HgWM7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-99275-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradeep.pragallapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A81482F2FB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 6:25 PM, Konrad Dybcio wrote:
> On 3/23/26 1:47 PM, Pradeep P V K wrote:
>> Enable UFS for purwa-iot-evk board.
>>
>> This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
>> nodes for x1e80100 SoC
>> https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/
> 
> This information should live below the --- line (in the ""cover letter""
> for this single-patch case), as we don't really care about that once it
> hits the git history
> 
Agree. The statement below caused some confusion, which is why I added 
it to the commit description.

If one patch depends on another patch in order for a change to be 
complete, that is OK. Simply note “this patch depends on patch X” in 
your patch description.
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


