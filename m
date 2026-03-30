Return-Path: <linux-arm-msm+bounces-100904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CZCAxXfymnEAwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:37:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD4361024
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DD3330177A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD73F27B32C;
	Mon, 30 Mar 2026 20:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdIo0hFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SM4xpQcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E86936CDF3
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902990; cv=none; b=qPuuvpKEi1FviduRDOuH+Vll3S0COKDVGiAtbkB7b4gjma4Yit7m9kdRac54rrkumdiadqoLhnMR+PjcdrZEP6RU50O4OvwHhM5dIqK0qMk5FJbiAensmXyhgMa0Ysd0sSAANMf7Lr4CYeor8lyJWmVSoU+QyxKUtT52rAhbxjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902990; c=relaxed/simple;
	bh=9xMnK9BobglZ1rmUxGIFUvfHUJxt6VDbE/xhZ4JeRGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYMAj0XfFXNFipPzwAp2lBVql9sImdlEhw8NYW0oi3LzOEir1xpWT5AjU0IaQE2sJDvkoMk9N3HzBRmy1uHXndJpK8HZv3kJ7lLnU70r4r9meKhxKtWceBF5s/uYXlY33ckxIYZA2eR7/ZWjzCD6IrJ1D2lmtClocgJg4R05Wjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdIo0hFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SM4xpQcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UG6dPF2723211
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DdCjqkFX6DAQ5T7tG9aGJIphu8jVEoKOAglgAot+pA=; b=TdIo0hFljGYZLFzL
	I8ekSn8VQTdIDt1StcIv6vEgMNF/Zhzo+uqG8Oi/9UbDlvKbZ0buWWYtD2Wl7afr
	g+E4JV9PRvVKAp+4xSXdk7YQ3Sp1IXMsG6OMldHVn5QKhYyZeZq4XnnWsEZIEB5w
	Y7zScZnFLg0ZIWMeWXZSsWgGYnlmjTGSoChFU5iMplTYfCkJibz/UMOAmhpMrjDX
	KRUxvSAhTqu8dghmktUFRnwUGD7ZbNs1J1acG6cOSeSCpPkBB3FXKLmqg3CTvOFR
	06XTNO9UdLIfmbB2sD/EnLT+CheYziNIAOeXfteQSqzbY11IjyTiYvvdl80K9y4W
	UWWkmg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7qt0j9ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:36:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c741a9ef5f0so3303360a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774902987; x=1775507787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DdCjqkFX6DAQ5T7tG9aGJIphu8jVEoKOAglgAot+pA=;
        b=SM4xpQcX1YPA4CPZhu3VhdmV3t+wTnj9WHef+AXkNU5lTsjvbxrjZXPPz3H7G/JTAf
         bzENdTcYxZzjs4nJRqu6ObieTtJ3jfKdySiw2LDYdCIs094U2BrZqLtCxa9yh0uP/tMj
         58Mg3yq0za0sOcsCXs1KSVo/piQCU1rOb9QlgeUOjnaeg24gzVqtCnadPq91Iljrtl4H
         QOGOpJdzZzPdjwqjb2TB53JY6vWFOTNJxoHSnb1NO0DjGVcyqiSLI0ZaPEP3k0yL+Ett
         cXM0pn7tU+Z/bonRJce8K1t7kb8eBoewOy608BVjlC6TluifYdNXB4bU0sAusdgHzKuH
         DWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774902987; x=1775507787;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DdCjqkFX6DAQ5T7tG9aGJIphu8jVEoKOAglgAot+pA=;
        b=HfhX1ps2lPJRYQsmEbPsNeTOF8Ofxnc1eysYBeUtEetbbbPjI7P7VXnasfzUVL13/s
         Wh2hzcrFOhjcF4na8tgG7qhlRZw0ghzZjI9474OAzOmV99jAZ++u2JU6idS1wBXrhXax
         qExJEST+BWimNd78wD0jWlwri/QENv1E/sdzs4GXo5Cyu0Rc5XUopHKbrIQJl8rb6Ryq
         ghxvZRcHrAgvaql10AU2GxH1NYjmjqlH56ZCNoGmXb/eu0to1vJnvHoJVNFE3ADFyjy4
         A8STRcDbceBg/7pW/ZcJvZSEQ03oz6efds/jklTrOFBD8UahX1MuiaXO14eec75N1fsn
         XENw==
X-Gm-Message-State: AOJu0YwenaayxJDaudpw7w+mf6mMFdI+a78eYc6Y92g4S5/ISKR46/4S
	QGhlb+iKJ21dKkHdlS9XW+IMfE/beQn0rcV7eNSMekskXvPoMSLzMF3UjHfaZyPjkAXred/r1GD
	rVmKTWsK86T9P57FYV2BjzFbpaPAZel3iM2tVpCfAtnPRLsVdvinP2wnCjvCnDfvggijg
X-Gm-Gg: ATEYQzxq6bWm7PKm98eXU1FvWHeNW87fy2ClEaQH/dH1+o+7nq/K24IpfE2p2HrSR/5
	3fGxNTVKEjhDBU3FIYbJT5txAyqcaRYLWV7e6s8lVScfCpv8sG7Z6vXV7nlrsebAN7rdNIngm41
	tTHF+Tx5nOibEDq2HEj87aPLzSk5NkGaxPEUGoABPjfDqeQ17+eKhmK5AtuhJdMtAKLD4ZcIZSW
	wAaI6XMA17LdQzAJi/bajFqxM2J47vF8/ckbTUUREWyIJyIblpEwP62zHQtutLNw95AVHmvERLF
	ep3TQesDOJnmjEZe/Qq4eM/iX78aX0hwEPxCA3QNysfsx7f1v6WIQLf9qt3fyQJamro5KfWGa1x
	kNCdRjj0MEkuZG1v6GWbT6UCI87LzPAlX8isYMC1DRVkN
X-Received: by 2002:a05:6a00:3906:b0:827:32dd:59c5 with SMTP id d2e1a72fcca58-82cd6652d45mr752594b3a.28.1774902987281;
        Mon, 30 Mar 2026 13:36:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3906:b0:827:32dd:59c5 with SMTP id d2e1a72fcca58-82cd6652d45mr752566b3a.28.1774902986739;
        Mon, 30 Mar 2026 13:36:26 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm8173031b3a.9.2026.03.30.13.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:36:26 -0700 (PDT)
Message-ID: <8acb72cc-f82a-469e-9683-0d2200071662@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:06:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] drm/msm/a6xx: Add soft fuse detection support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-12-2b53c38d2101@oss.qualcomm.com>
 <f7412989-5454-4877-836b-268ca27c5731@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f7412989-5454-4877-836b-268ca27c5731@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XN09iAhE c=1 sm=1 tr=0 ts=69cadecc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FwsNaeLtNlZf7HSmVAIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: M5wwIu-cQAFdHRUUxe-pC0M3y_YZXMoU
X-Proofpoint-ORIG-GUID: M5wwIu-cQAFdHRUUxe-pC0M3y_YZXMoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX+SZpfRBF3IUH
 p/REE/4jYcsv75R7mdgdYEIjW4CddptwBtvSI5GmITQG5qVFLIKNk20gDPbj3EK+OAANtejkEmy
 kHeF7CJfHN7sKf/Cec7uklSZPQb7UrqIcglFW2hoSHO7Z/wQVCdCHPQ63dElGRLYM95jREtqJ3b
 jkUV/D86IKaJI8jhLbzS33BaaK0NjifcB854Ev6VChit/kbP6iRG49d6HIIe3BwhlTmpmn4eI7l
 vMwtnofVPJnxmEN1im6gn9UlRsoJDS3ZSNjJYaAdFQM6dDQ9ax4VfoBEWfxC2pN9DmqBRpTL2Tb
 ZtX1YF2mOTI6jriVW7TkrbjUQ1prKfPL7T9FAexZo1FT04GBi4XixS+mkL++z2PryT61mzm/eej
 ZyehPlJwzsHApo9UhLTTZIrUBixQPuB0A1gN/LaUuQCIhyeY1rEBanfR28xayGhoK3qD8fo3SDW
 z77+mj2n4noxmh5S8oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300174
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100904-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54AD4361024
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/2026 4:46 PM, Konrad Dybcio wrote:
> On 3/27/26 1:14 AM, Akhil P Oommen wrote:
>> Recent chipsets like Glymur supports a new mechanism for SKU detection.
>> A new CX_MISC register exposes the combined (or final) speedbin value
>> from both HW fuse register and the Soft Fuse register. Implement this new
>> SKU detection along with a new quirk to identify the GPUs that has soft
>> fuse support.
>>
>> There is a side effect of this patch on A4x and older series. The
>> speedbin field in the MSM_PARAM_CHIPID will be 0 instead of 0xffff. This
>> should be okay as Mesa correctly handles it. Speedbin was not even a
>> thing when those GPUs' support were added.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> My comments here remain
> 
> https://lore.kernel.org/linux-arm-msm/20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com/T/#mc97f65496ba60ecfc977bce1b5bb6d3922711ae3
> 

We can ignore the SOFTSKUDISABLED bit in the driver.

-Akhil.

> Konrad


