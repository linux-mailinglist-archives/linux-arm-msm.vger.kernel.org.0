Return-Path: <linux-arm-msm+bounces-100775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOOdLTtdymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:23:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEA635A299
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BF433008294
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CE63BD644;
	Mon, 30 Mar 2026 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5vrsa+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezBPLgDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2A3C0612
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869545; cv=none; b=OJ3nc+Ah8oo2zQ86D180zQTXTHD5BLJ6zVlLcvtoaSuY5iVIBvgKpN4XSx4Dkcw6o+h3q+mTfgv2xSncJuOGCPhUYpYY7q1xPPQMqG2JCrqsp516b9+/vaBp/BQxY3ZfBqsJuyblORXoDdi5OVl0j9NESCRp++AYl7fTJttFKSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869545; c=relaxed/simple;
	bh=nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFLvnDRubC9IajkNhz7Kzr4hh7Vii+hyH6SUrI2DW6MXQ+xCuLCr0rXRYtQlA2Lf1BO7f9v92KKe/qKkdtoioOFie4VZv751vu9zpJcj/KS9ovEW100cresoy+rpViR5gw08bZSoavyNiPRx/yqmjnck37mYa8lgzylxnDBArr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5vrsa+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezBPLgDZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6jJES1092976
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=; b=M5vrsa+3fUMTvHpN
	R4r8YAG5do0rd6uVgMpdxA3GUV/CpHibqfk3AxRUTQ6xYqdRzuWmxWDRBRn5s6Kq
	qPE9z/wO3StzK3mq5IR+h8ybPjOA9T7b5Tn7XUeyd1IguIr9bj+IdSqegEvacKB3
	TkLB0kTRZmFQszEF3+GtbufyGIzDvvAVePhkPJTYpwhuYzCsHfhi4K7iUmHGGpF2
	VUknKt9x/iIe/SEI4VLcpwPJfnt5vLKEIQ5nEpFaeVGbp73MMAmTrzNyRYFB+i0o
	4qd9slaq0ECgvfg4772fmPAhIDbq+bIzV4T3nSs/POsB6C3ANB502S4go+ByEQL+
	cE1/qQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67715ur6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:19:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d1a5661ff1so11531885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869542; x=1775474342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=;
        b=ezBPLgDZ4KFiDZrBfdmylmQBGt0MFB9e/FFykrWpWtTygzjYyCbJD9sm4df1q2eHBd
         NhsPz6lVkkSmO5Psc9EUuxhOOZRHXxeIr8zo/qbpvZ0SzX1Ns8ao8V0D5YIRAQECNXhZ
         osgCmANs3+8BpUzPjwkCbBfGG5PABFqfIkDbfVp+J5WoOXpci9zna3JB1fgYxu7GKjgr
         Pf67Qpa9mUZTRVhrsn8xUUHv8E4JAO+c/ZAgyt63a5RlvMtywzZ/Aey2xfzAAci7jfbI
         vdA1vNIvDXr4JD1QmPB/Ip7hfsAXpUZTzohaq5JAz5gkTCFJIR1b5nCT3SGhn+Kchld8
         FOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869542; x=1775474342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=;
        b=fnKOMrnHieZ8D+I+VV7YshJr6N6NqMXyKxAffKqzvQdlqh/7uEpuwtlamAXDk9GE2t
         fq8P1A+LS7f20FeDg9J0HtvxBBNzwd2ycjRYkKRLFe6bhapH0lJMDBJnbyVcveUMlo9o
         Mq1VKgJx2LLPr+XKW9DQzz2EFO79vFIHOxlrfUX49ImFSXKfZ6C+Aqi54i0UbQCgrhyY
         S+I/sPH0MVOGd4uJL19ofFpDNUSVAn7MiJTEIPD8LbxY7FDd0ctIHgYYWpDTOcdIES/Q
         MaVEyyFUPKW+rTqt7qprM458CkHIetQUzWxjkJtZTe9xzatf8bTSSRIt+SCbXFbH7e/k
         5H7A==
X-Forwarded-Encrypted: i=1; AJvYcCWPcZ9Chzn3N1+OOH379cR6GgPtVWidCHY2Ei3B69aK0ZqirGrOUboB4up38J7bakZIMFLSL1kzYCxEO4b6@vger.kernel.org
X-Gm-Message-State: AOJu0YwcKb4W9PatVs4tpCfn0Kt0vVvbiInTlcjTFcuSrQRKli6M4gZd
	swh621+1GLxx4dRvureC+E0avlQmw3npZtwXk4q99oCw9tCqLkYkECe/UKoGdAheNji5syhB0ii
	eXBCo/M1Ydj9OAJxw0KgvRvIg1IAD8sJALeTU1lZEXKF48HMdNCIp015WPBBFZQLNlVFG
X-Gm-Gg: ATEYQzxmqmKwmxxEmeGH4zqZApyU0f+una1aGIi8ii347dg0A2yWRgGZCLsbqjEPi07
	66/GNrC/66nkY4Y1NSJXb0pk6YwWhAvhG+hkoNAReL8hh0ypAbT6gsY2p3tsZGb6+0HtTcyHBMV
	JixGDD89q/bS9ii9Ei2JboYXAljc6M30mB7Rb0LWg8/4p9ESFUjrnAVpkc+5eMo3pAzCrGF+k6v
	XumCtq/f87+URu7685W8HCUATgaORQcEwnGVm1esNJoSqA3fTYrhkJUW/pt9dDMYZszh9NYhbVX
	5OpqTqRd4MNucRBCMgG7aFIUeTFROP/tHJHtjmxZuT25DRcUf2ex9dShzMh4DxlTnhTubu/ZuHd
	3rHpPg4+kd0jAbvMW2krAVpqKbrOtHlK79mjqkSZ/SWNSesh/WViXFGxu2lZszBjUZ3/OR5DZD4
	gmwRE=
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8d01c322c10mr1083813085a.0.1774869541640;
        Mon, 30 Mar 2026 04:19:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8d01c322c10mr1083808485a.0.1774869540995;
        Mon, 30 Mar 2026 04:19:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72a6ec5csm2366019a12.9.2026.03.30.04.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 04:18:59 -0700 (PDT)
Message-ID: <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:18:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FW8LwU4MWYgOSZMd19UGf1DLJpCDuu-U
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca5c26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JwhTZQfU3B_gdtkNLGYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: FW8LwU4MWYgOSZMd19UGf1DLJpCDuu-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OCBTYWx0ZWRfX4psfja3GGpOL
 ZhFC8dLI7w4hw0eNKItO9UlnQxeBw/dIynkO8AlaT4iZb5EDQCysoAs2gTVlRYlnwyB856fCz8L
 ik727sK9zvxgmWKSkJk+O07fK2ivDD8cbn/X8NuI8zQrM26Io0YIhwCstTbNMjhW/OJvXClXGbP
 Pt46tUsjioQwn1PC0PDmv+TVDrEUcJXEVB4YxV4wwvZCXbafLydF24CheyWTx+IarED/NfzZe4Y
 kQ3Sa+2OZE+U3WAunrAeFtMBiD2sk9QMejPnd8uQEkOyH/d/iJvwUGufc4URkkoUH/rJJ+99l9a
 qXY3ItXBVHzWDnrrzXw31K6BYe3mouvLIW0ZJ9/4Wws/VuYljIdiTJGsZ8QNwaTc6oyi7lMmlfw
 nFIox8qtMbpVXvMTGqAHl/nv3r6jq2guFZTrVCUcrvwY2bBk4YvoJ370jxrWBn288SrnxPAtwd3
 ma4AkA3vtvH5T1gZqgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100775-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DEA635A299
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> The clocks for qcom-ethqos return a rate of zero as firmware manages
> their rate. According to hardware documentation, the clock which is
> fed to the slave AHB interface can crange between 50 and 100MHz.

FWIW this __may__ possibly differ between platforms, but I'm not sure
to what degree. Will there be visible impact if we e.g. have a 200 or
300 MHz clock somewhere?

Konrad

