Return-Path: <linux-arm-msm+bounces-91496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGT0AqGQgGkl+wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:55:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63923CBF32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C21D5303E4B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 11:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F797363C64;
	Mon,  2 Feb 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbCf6549";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qhe6hUCm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A17361DD9
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033103; cv=none; b=UiqHcpfRMSqrYPBgJHDyoYCNRqOkRWoPg14DAlPrO3Zhv/2D86jtXPayRHmpl54/3+tlx/pF9HJ5uGizgPnfMFr5g85wlUDLRfrs1FJXXhKmK4HMVA7hGIgvFNS/HGVh8UznBX7IXrAnhbmIT5lZI2sAm9Rtzct5bbNbRQaqAUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033103; c=relaxed/simple;
	bh=2RcZz8zMppgUHzYukI6i6EPbqBokKa15+MZGuJc/uGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJno5gHxse6RIV5/3nWAEsreJUsnlAJR89kk81cUIV/Mh+VQUbE0hYItf5VtwsDZS2YuaLBAqI28tBmKLMxPXviklo1lJYYuWIdtqNfNmb/Vh4YDB1wbYWRKOu/aTIqpPT+kStSsOkAetV6FMGAsTwPTpdnpUWeyG9NajOB7r10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbCf6549; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qhe6hUCm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61270rVY2028623
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 11:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ee55MZ3ARbWh4e7hfDzpH1R3rman0YgA8GXFXm7jzj0=; b=jbCf6549qOTFTcKu
	M6TzE41W20tdMKZ4Wwm6XFv1umya2SufTzJWxlYsJ0hFwECme3Owxv3Yst3uJ9jy
	kbCWNDMLsrAxCn/pR1YATa+2mcZzWN21oYpQnycp4ZUXWtA/AOoLMaNilSdZ/pEz
	qetoMLHzx/C14/j2M1axCe0iLsNaeRj8CYXKFUfY5xLMkkW39YmaPddWnvKZUags
	ZKxFbHjyP/YxfnUMZ+gsLR2/87LAn4ujLWHRKFY09FxmU0WMXmcSSe7fVBHT5g/r
	rjulUJ9uCsl61vn4NWW2Cz3McNei7m5vtBZmypE7TpN3bXMZQEQH4ukKAn/TSPnX
	G38itQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdd8q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 11:51:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c53892a195so62366085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 03:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770033099; x=1770637899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ee55MZ3ARbWh4e7hfDzpH1R3rman0YgA8GXFXm7jzj0=;
        b=Qhe6hUCm+sknFrzWgAWMYrPfK9crH0spus4VKlHNNR8Z97+jpyAiIwHJW7JiXU/rgl
         NEAF7pERU+rpTH2VUiTnm6bKhuj3HXMycbXkORHlNgW5o41Rvuuc7lpz40A9wqLkUGX/
         QmvgD7b2s39mkRfa+uHFJSlsCgFfLEQa2jv0MNlbRZK5+AqctNcrtDcXm/lFuM/N5INE
         W5R+YBq8YbZa59kOasKSfTcrcQ7e7qnlW+xPzGa246LGpw8vPYEdIUX6kCc/7LuVttSZ
         ZrvPqRVtk5yyCfICyadnMzRVzCo5QSRz4zDGvkdHPBVYHx4TvJCFnyfZyKG7f7kef/z5
         ErkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770033099; x=1770637899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ee55MZ3ARbWh4e7hfDzpH1R3rman0YgA8GXFXm7jzj0=;
        b=uxUPk2mthNi0L28CdkbU5uMkKRl/xJd0js0+NFPttELmJM3OG4rApfLsk/Svb+2k8m
         lE/WzBJSHhilPTT8fgTp4cFRk1HNSdDBmkfVx67ii7E2mYWliOndguwiB5aMQ6zW3EXI
         papk+j5Hq3vGAkTICSMVwrSKjhh52fpIvRo9GuuU9XLCiMfVgFqN4aqcF9iw2VArfWg5
         UH1hIEa2v23yR5qfOESJnXEA1e5I39nu4xdiSkgCgPxb6trUog+BcZIebwoll8F4CHuz
         Krgv1mtJ2uYdnYzMw8zw3MTmVspEjtk+DNTMH9qt/by73HFS6GHhqpi3IFCfqFXGCdv2
         FIMA==
X-Gm-Message-State: AOJu0YzrJZBRBIjvRq6PYeDfwaTKZ8eMzVBqMnBm6NZ0CEbq+HLlfcuL
	Jkg8QNC5v45G5U/NRZs8G7aszMEZ4p4EbDDfnWkSAxMkP0q9NficD/i8bEFAFfzkRTefp6GXKjx
	5E5GsitOtwqNynWE5mx4rp3IuYi8WESz0D9l2rjt4zvXN6FCbz1pxW8NqrZTf5YNhLMH7
X-Gm-Gg: AZuq6aICu9LCMSOuj/p15cg9GepveQDvaGVuHWFu3ZsET40VIIaIzPhD19ZiCbK6J8d
	vzjmOXz5icoRy3Ugqi1QPZdK2jP2tamGR3Kpf7qbqN0ZGOZs5g5Tbq35KqhpuPo5JsumGWTBOuW
	hULikWu31oKT3WCeqXMshWLp+MdkZQqXpjhQm7Id2uShGZH7bTaLDO0rDXcIWBWitoef0aIA90f
	IwC6dPiYmWK8FQj5W+d+tiicFFdeOQZg0Kxrg4gNXy7gFBfIDTbJqDQL3U6H2KozcOWdeLZ/egn
	p5k6FqElEL2il7APYmZEUw8w1ZSraVTsyQz7qvktaU5dc8joCpN+V6tbbZOcKyTPt7oN0kPDjWP
	2GnPvF6ayH3PKixmaYT/EMYeEwuDje3H+UFUWAChFuvuzcFyC0R6hQXjh6getcc5Yllw=
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1098493385a.6.1770033094349;
        Mon, 02 Feb 2026 03:51:34 -0800 (PST)
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1098491785a.6.1770033093918;
        Mon, 02 Feb 2026 03:51:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8debc6e956sm662747266b.64.2026.02.02.03.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 03:51:33 -0800 (PST)
Message-ID: <f512db69-e187-4c6a-8080-7c02bcd46ee2@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 12:51:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom_scm: Fix coccinelle warning
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20260202113241.3058845-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202113241.3058845-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -74sDP_VxhpNC3MYVH15sbJP21jZUava
X-Proofpoint-ORIG-GUID: -74sDP_VxhpNC3MYVH15sbJP21jZUava
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5MiBTYWx0ZWRfXy1TbYWjERmxL
 LTw+33tcJv2BR6ebYdZfJwrXAvUBqpITHxv5lj8Cauk7+/JHCKASpqPKbw3WMT69D7pkP6BsEj8
 lSWm1zXanYsz9pXKjoYp7Yl0UekQlAUneHLAhaTjuo1uaAvfIxVKC1glYPbtv/vINIwBVBDc8TR
 R8v1v99vAZZFQD1iH6mpiAkP8JiJON7wnP4cF+atevzJ4a7WeXx7R7ySI561pHYP938QHX+qvKY
 PD9F5MjwRIKoaNhn0J2LxxklDSqXIQsgsNtsh0CCjcDX0XAF3cz1zxTBShC7lUbLyYuHmVMmek0
 MC5B7CVeUV5HgERWhHDPCtdYQEe89ILPT5VLFLz1eb9iUtLtZoGumx+/4lnC90QTj0OWQRKMGx/
 9j69fLJTBYl+IbFQUB3c3T7dGXV7z4kc+ahn0nUyovaUeWW5hcWAqVQdfjRblGmqMaz0FKL2HaW
 uS3uDzOsRGxut0tTtmg==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=69808fcc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=pnntZYRTDoYjy3QyU7YA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020092
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-91496-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63923CBF32
X-Rspamd-Action: no action

On 2/2/26 12:32 PM, Mukesh Ojha wrote:
> Fix coccinelle warning of allocation and memory copying to allocated
> memory by replacing with kmemdup.
> 
> cocci warnings: (new ones prefixed by >>)
>>> drivers/firmware/qcom/qcom_scm.c:916:11-18: WARNING opportunity for kmemdup
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601142144.HvSlBSI9-lkp@intel.com/
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Preferably the subject would say something like 'don't opencode kmemdup',
but that's minor

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

