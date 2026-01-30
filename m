Return-Path: <linux-arm-msm+bounces-91283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLyOH5OPfGkQNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:01:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC8B9AFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 824593004F3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747EC369997;
	Fri, 30 Jan 2026 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdhXgw/m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNgBcYje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323D1378814
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769770897; cv=none; b=O5aGHMaR/HfsQuWEHchsqA9fwWkfKxXWUB3/JJcanE055RCl4rj4MAH6o2WTh4ahX7fXZ39MGRBWz2Hf8Cl2G6Vcq0x1z0f9HivJ1DjfTEuEziB0yeN2seYVVxWtE6+Si9W84geV6mXkkD1ZFiE//sGzgDhfzAjspv2zHif6fQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769770897; c=relaxed/simple;
	bh=Ocb4cwSqeyUpm6HHrVdUOvuXyr6SxolC4zJYIS0l1Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GvbShMz/5GrCYQkFNJfpscycBMj3GZ3aC3RZFOwA17MOI5urctkqLudP4jESjJUTS0BEH9fBZ2oMaYrjzpngtIGkcDplaAuqi54YgOJClwlPPOdU4N49Ivpn3EdxWg8gQhO1mE1iOk0jUBryIcuNs1YrWJ4/6RdPmy3yl74ji8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdhXgw/m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNgBcYje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAOuAg485878
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yL61fxyNsQb/ZM9rHWGjj9E3XZNxgelcLHeWaL5jiY0=; b=BdhXgw/mvMiBt0+q
	GbZ1WGSU9uHr6DQOowZjJOCTrKw2pvGheNTbGy2hlZ++P18JdTdb7cCmHwhuBIg6
	r3Jw1yIfES9+h75zXEBKg80Jf6Y07lmC6W7nMjISzT/+rzZt2S+bxfgUzUhiDt6q
	QLg3H6cS3oRDUz2JGeCMzddiEQpYTmrj0RwFeNO942lMh1cH9Rw+FiecZ8s2rLz9
	aloWUVCkvFCb2nGFmewJniIPdMp0EsykmzbDWqvaUXwmg+AlQDmTzcajYAxVZ1h8
	vdEqIibP1GgSYXlqHPikW2V+8qobYIO/+V4/EfsLgHx0MGaO5qYX6XAZIEzDngiD
	VVylhw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gtnhuqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:01:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5636b08a8b9so4146e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769770894; x=1770375694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yL61fxyNsQb/ZM9rHWGjj9E3XZNxgelcLHeWaL5jiY0=;
        b=XNgBcYjeyapbZGdzp0B92ZLVXb7sWZHcP/iFv4g5CDDtCLRqaxRlF1wfbncEOJZGOV
         7QwP2xIoeUiECaQs6xKpIkKXh2ZY5O+YW04DNVPI9nrfXzPUORSs02b8/04cQnHEQ/qg
         uST4LzOSxkXqRgNaMMvkBXi5GP+F3V4yEjqjGQ8yUpskJB7dorYqXX/b8IKtVsg8Wo6f
         gNruEfrGsXf72Qw9FkidLaAhQf8sA5wttHhyygBvxSPYVDOVbUP+Vc5Q3MKU9AQCJUxI
         keq9V3PAFwQs+mi3mfq4wUucLJXR61a35bQyz+QqqMF5LRnJULF3l1ctaO1er022GkIY
         G0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769770894; x=1770375694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yL61fxyNsQb/ZM9rHWGjj9E3XZNxgelcLHeWaL5jiY0=;
        b=dCpxhuFAox0EjJOLOAzdrnAbF3rAxHKVckzQkXoq+nCMmf6z6lSXjaET3Hin3xxw8f
         ErZ4Xc/BwkqU+rAN7aiiKOQS7CwwnkliNvzd6J0cF6MraM/I3Yfeum6bz11lXIMEodlM
         +TqWodi3cIHCdlyGXnyiR4aMv1DrOqE1GMtqoHWOph/ApMroRO9e38pUpxg3fyHeL3Nn
         GUig+CKqVtyPEzxyrKFRG+M+tCg2971HO1sqJVi2ei7ahDDrcNqf4JkyPfpScGqo28cX
         vddmf9qQEtF0VGyhVVMYlPgMYpwVPzYXI1LOpGNac+9/CSqzXzkJbt1WljII4AOWZUgU
         hufw==
X-Forwarded-Encrypted: i=1; AJvYcCV+rIVp0P/aG6XgM/oSTmJSu08qz1OOBEtV053xji9WWVG39U8mMpuWOU6NUozlOqtczyOBltedVwrWms6M@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSQW94+xgr5OIWFQvfgOLYoEVdajCdfUHKGmHSI5SBxxs9pbb
	Ia5Ho0dDicKZeBUFulSFb5R0T/kB3ylnqDOXFsIAhaPSXffVTVNjujIOz4rprDZQHDx8N2G+3JH
	mFthO/lm29Yr+EJS0UR12qEr9eUYr0laSAjcwv8IJoPkvcFeS23w81b9rPjUC02scS8puzj0own
	6d
X-Gm-Gg: AZuq6aJjvYGhHvMKC1Fzrs44oHNhne8k1O8bYLx9ttNNcmj6GHkk3uj8U3+swhRelPg
	nyneFMsgNhj1Xz0dTEAdITQy34mK6mA/OxMKtwQtuU5YpzEAUPoq1DjkBS7JMmQtFLYnImvl6vy
	O+22Bg+VtugCKSXGOxIH1D+0aW6yeb5QNMdZoxDDYRd5HntVvqyITehOIlPUxPHklEbhWan9LVc
	QKLzAeokta0DGVp0N/pbEcjUnfzpOIrDhxtPJK3IhdFENUWnlkKqkElMfBNRNsm0DZVH3t/klLP
	8OZIGLA5tNLsyXczWYgHbXJFbZqASElidroAQvF2F9BjS5Q3yT2/Qx8sYFrdNB3jh3F5sY+ZtI/
	IEdDQa4CBZr2HH35Ueu4vhBTGysQkDXLev2627WxXlE6la4WGR7JMC83XzbwUd2rRxl4=
X-Received: by 2002:ac5:ccfc:0:b0:559:965e:f563 with SMTP id 71dfb90a1353d-5669fff2942mr303599e0c.1.1769770893980;
        Fri, 30 Jan 2026 03:01:33 -0800 (PST)
X-Received: by 2002:ac5:ccfc:0:b0:559:965e:f563 with SMTP id 71dfb90a1353d-5669fff2942mr303590e0c.1.1769770893528;
        Fri, 30 Jan 2026 03:01:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e0901c150sm76612066b.69.2026.01.30.03.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:01:32 -0800 (PST)
Message-ID: <aa90c5ca-72d7-48fb-b3b6-4be8a51dc0cc@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:01:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Aaron Kling <webgeek1234@gmail.com>, linux-arm-msm@vger.kernel.org
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nUVdG6GTLEN5gKZLu6RmksA4vM1tpQFx
X-Authority-Analysis: v=2.4 cv=FPcWBuos c=1 sm=1 tr=0 ts=697c8f8e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mX1JPIkwxSeOyOEhtiAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: nUVdG6GTLEN5gKZLu6RmksA4vM1tpQFx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4OSBTYWx0ZWRfX/QHQqLz1j9Co
 KWqFKiRBxA4dJDMVpICr/dtna9XOFwI37+DhHoMXiDlRmY9pMHNumCn471ZAdCIa5q0tUzznjeN
 q8/EkENXT/qRYOJnefBmXC9Fjnvt9MG/Pkawp94z0rjNwHpENe6IaAX7lRSAAQyOL4ys/mupEHS
 ZG6iihpvbJ5AZ3H2hfF7bdz4wcVTTJRe7BJ37ofzAZ7mpvVm8YH5+Ioeg0xuuW5xmPHH3ZybyX8
 Sr8oqMY8G/620zwZlh6iU1wVFX22Qe7QPFbYyxB1NGMTqpeQ6IVdZqLfpqDMJrLFTfnp7gXKNsl
 gHdEjGmoo20uZzdSqX6LjUK+FfleBmTPp9gQZJmY1NJ0BVKHhTsgJ/u7fkvquT8xQRf/3kf5BYx
 xB6b5yuMleIbMcJOs1Is26ynuu9olY5DHJzWyX9YqH70VpkxmVJNaALrzvcFZOPWCOuUZm7E2vF
 8tknXthsyuAx4SQPDEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91283-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1DAC8B9AFA
X-Rspamd-Action: no action

On 1/27/26 11:48 PM, Aaron Kling wrote:
> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
> for Android, using mainline kernel drivers. I have come across some
> missing functionality and failures that I would like to inquire about.
> 
> * ABL fails to load a dtbo using a baseline dtb unmodified from
> mainline. Using changes described in the gunyah watchdog thread [0], a
> dtbo loads and the devices boot as expected. If any of the changes in
> that post don't exist in the base dtb, abl will fail to load the dtbo
> and go to the bootloader menu. This appears to be an issue in the
> baseline abl code, affecting all devices of that generation. Would it
> be allowable to merge a change adding those changes to the sm8550
> dtsi, allowing an unmodified mainline dtb to work with overlays?

ABL is.. picky.. to say the least

Could you please try to check if what once worked for me on a
8550-based Sony phone would happen to work for you too?

39c596304e44 ("arm64: dts: qcom: Add SM8550 Xperia 1 V")

Konrad

