Return-Path: <linux-arm-msm+bounces-93254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PrwL9mDlWlrSAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 10:18:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D3154A91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 10:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 744703007F78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 09:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2280233C1A7;
	Wed, 18 Feb 2026 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEHBZCmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZSi3poq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4159633C1BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771406248; cv=none; b=jQq9ExrHFqxNgGgqCIARfyda9eOlYWZzWvWMEpDqzxTTVHVQCkasd8iQEezP/fFrAZWRBZFrQ7PDVmilKF+P9D+kJaYDxVkZKX/GnEmEpp65iTWDFD3tjW8WQ1Fnd71lWNWaERDHDIBYE2C2QvVosbnUXudcqft+QpEmGjyeNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771406248; c=relaxed/simple;
	bh=XnA4ayKORW1q6ZfELcTB5jOWEzzvzBRZU+q5rkTqF4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEbRWUHUkCyWzWrXhjs1fO+HlXbOBYhvTeI+tbJKC5Q/fXbwGObv/dU9aGyL+UHt1eC17SPivO5gjauelOZ3xFnyUaNdAr2PBtYeTxhlgReX/DxP2P5hgKcDNeZmo7Pmp7KjuB/yk2A89h1o5Lq1x39fsNlpm0M7cI7Kj83BHV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEHBZCmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZSi3poq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HNqrZN2112094
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BerodE9udH0yTvTl3i3zzvMFVQxy5GnH2IbIXbjYmqU=; b=KEHBZCmo2A8FVxq5
	I9m+x7IUSl8fwuMsuFN2X9xadr95fm5rgMLB1Pg9ydZg/LpKBiWmTu5HS+ILHoKZ
	vjUn+4Dh9nm10+krDfSs4vhKsDqh9zmRtkZXDuyZiBEdchNd0BVXE6zB7FiPDawP
	EOEYV+Q5U2GS8vtNQHc98EdHoo1IhaqY0qRz2N7WY4iTAm7GTG4lptExwsIGeVCD
	6M3SzDnml2e+HWmaB35g3X05EhYZUQcfopPtkpCX1JUrT4itRLKnyu6GVcpyOZqO
	GVYt/jrrB7XBOfIi8/IJ22xB1YehUCda9BybXA+sfoQ15W53zhS6imfG6FMrFJyS
	vhJarg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4m9xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:17:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad147cdf07so46320255ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 01:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771406245; x=1772011045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BerodE9udH0yTvTl3i3zzvMFVQxy5GnH2IbIXbjYmqU=;
        b=fZSi3poqf/uUMTHZ/VNCCxUQb1QS99/uoF+JET27AmBRmkKf7Yh0bytyeFK1A6kB+c
         Rz9fcp2aGXb67ld5gFlx+/tG+0yZNsWvGI/kjaFVEfsW0yzEObuclcD26eQTHnu2eHf9
         6BApgrXQR4rspxSZE52DCiQF8lJTEbX8wM8FWKt8mHyUN5EhgC2pbM+/VH12Oqq1H/5S
         HMfzTx4r/Hu/HMXgrjdEr1T/T+oqe+Wq0poOz7KqvHoi8NFCTyGMgsRJkx8Ee7NXibsU
         MjVrZSXKFS+anSQvo5JGBrP6J2AacqAuhjCs0i3Y7B2IWWfY1Rz05eQvLg/Za5lpjq/L
         8Qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771406245; x=1772011045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BerodE9udH0yTvTl3i3zzvMFVQxy5GnH2IbIXbjYmqU=;
        b=Ql73Gtwkn2q2Y3asQEFwQK/DDkH5ZtByZ2AWhI6z/A/YBFDZoOvDP7UBTEhM+aHURf
         In7d5dWpNF+HH0RLCtc+mM4RTMzGos02IR5ziNdH1aU2qtWKecLb2/Q9cBpOOkr28DIZ
         pGIPn/Dz1pPEka0NfTj/Taq+0LSdH4UiqlJxoe3Yd276HMrZZ0J04+HbtIS2tq5anYek
         7G8IQ1rIgc0bk8OxOA5wQGbE5y6NZpmnqh6U1Rmu7XHGqUKqyN9leULiP51rqyRweft7
         k+Gf6X38doNnNHWa3eZYuZlpJGOnyv1BLodjyBSaxLbpfpGj5P/P203JxzWoXdqWq1PA
         LlgA==
X-Forwarded-Encrypted: i=1; AJvYcCXtOfLaD807u8tOHSkvJN0RBmUG4Tkz5YRwYScEoJoXtr6O/lvEbS1Q8XdLBCV3pChtOZFZVVFdCvwkwm9u@vger.kernel.org
X-Gm-Message-State: AOJu0Yzix22Plvw3VcNAbsmsnxS6DJGJrehvkw3Oxisz7NJiIJNnVC2s
	SKMLAUrkMUYE0DR5vroxmdWBtzsPBTjwFXscoW4ZClbKD3WdpBcQun4l83OVf6byfDMKjVsmtzG
	R9z14601VIVN335N3UVOISSj48icEoq+OjInrBOt83aadsncpSLOfsC9zyDapr9nrdGSE
X-Gm-Gg: AZuq6aKGgYEN5m562inVEKet6oCK5Bq8ukilwKWYrpttQaY/my+kQqWYuYXtWrDvAoo
	L4WDMOy8rqY86PigVMy5jm/4AMFXDAL/seKSK7gOjyxLyUOyQL0mfwTFSWiuS/F2E30fW+T+x0v
	4Jfy94ZXmjrFQd4n2hBux6U1MsFq15R/HG8cUrPREz+bAsXTDXO2RXFfyaOjTSV43Uu1TasNvXE
	9j3qxZVT4iI+QZodlR87O85m67uxqVrvumUNwaeJ/74VESFSRoad25ICqvGp37iG4TrIfGnfZ/t
	jQpPVGhYOklsARFBR4bybV9u/fqYsGKXy8u2y8aTJF5gOtiRjWOlmH569IBQuHffWb1CR0uGl3G
	XQdVR8hDDYvePRMhVUbvncKyNnnYWKD+nmNQRRe3v5yn7S+WnLvKXx8I=
X-Received: by 2002:a17:903:41c3:b0:2a9:4c2:e51 with SMTP id d9443c01a7336-2ad17543e89mr154207925ad.55.1771406244542;
        Wed, 18 Feb 2026 01:17:24 -0800 (PST)
X-Received: by 2002:a17:903:41c3:b0:2a9:4c2:e51 with SMTP id d9443c01a7336-2ad17543e89mr154207595ad.55.1771406244019;
        Wed, 18 Feb 2026 01:17:24 -0800 (PST)
Received: from [10.92.201.171] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5c3esm133417595ad.47.2026.02.18.01.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 01:17:23 -0800 (PST)
Message-ID: <c247a57d-b4a9-4c77-9334-c338e5457a48@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 14:47:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: Expand control port access to root
To: Stephen Smalley <stephen.smalley.work@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Paul Moore <paul@paul-moore.com>,
        Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        rsiddoji@oss.qualcomm.com, quic_sasikuma@quicinc.com
References: <20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com>
 <20260206183657.0477e50a@kernel.org>
 <5b2fm4nbceqdmeu532vsr26il7jroli2sh6azcwirzm43b32da@grqzpgmmdvyp>
 <CAEjxPJ4VA58rtSEEZpxeUZHMjURtrUbZCvV8kAkWwJaoR1YN2A@mail.gmail.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <CAEjxPJ4VA58rtSEEZpxeUZHMjURtrUbZCvV8kAkWwJaoR1YN2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=699583a5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=9YfBhDUXH9MDG8CxehwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA4MSBTYWx0ZWRfXybXmoWlE7Kdc
 /W7izmDR/Mp6XAoUF62VK5KKljbHiomkgBmT+LMHYdratzp7Ta/dqLYZQZahea+VeDwPuAV20Er
 OBHoPzO718ol/QZxuGSQeYZRdT1UaoMnw4jjwUKXY/MCGLuDHqvHMXT5ihIh5uQTjdcIzMwS81n
 ai1MbJwRXjhcl4Ea4n/y4RUCnkXqF8hjzv29w38VtCTacBJvWWJXKcut76uxJjNr1MdVS1N+vhr
 B+JpnK7l4g69LKvlenqcmunSJeOEm2EI+j4gV3NNOHt1fD0cMKP+2cht5QE4Vntr4+swI0/kHVg
 ZBe+Ck00yglsSf0F2kGzM9Lu8+O9fYrS2YR+60Hd4Nr8J9QnUEJU7fM3J90JzlRXrSYEu+r5nOE
 5wUGCPk2RMaCmk9pr2ny2Th/M43pK0XmZmWnmlftsNKX4oRmK6Ht+g2+XtNfY0Mq8MwzeLBxeMC
 GeWC3d5pOkTnS94zwjg==
X-Proofpoint-GUID: AY1dD9bgne622dv8_3OapVhi4ljZxKtI
X-Proofpoint-ORIG-GUID: AY1dD9bgne622dv8_3OapVhi4ljZxKtI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93254-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.santhosh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 256D3154A91
X-Rspamd-Action: no action


On 2/12/2026 12:07 AM, Stephen Smalley wrote:
> On Wed, Feb 11, 2026 at 12:20 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
>> + SELinux folks
>>
>> On Fri, Feb 06, 2026 at 06:36:57PM -0800, Jakub Kicinski wrote:
>>> On Thu, 05 Feb 2026 13:51:31 +0530 Vishnu Santhosh wrote:
>>>> When qrtr is loaded as module, qrtr-ns runs from SELinux kmod_t
>>>> domain. On targets using upstream SELinux policies, this domain
>>>> does not receive CAP_NET_ADMIN, which prevents it from binding
>>>> control port even though qrtr-ns is a trusted system component.
>>>>
>>>> Granting kmod_t the CAP_NET_ADMIN capability in policy is possible,
>>>> but not desirable, as kmod_t is not expected to perform networking
>>>> operations and widening its capability set is discouraged.
>>>>
>>>> To address this in a contained way within qrtr, extend the control
>>>> port permission check to allow binding when either:
>>>>
>>>>    - the process has CAP_NET_ADMIN, or
>>>>    - the process belongs to GLOBAL_ROOT_GID (root-equivalent tasks)
>>>>
>>>> This permits qrtr-ns to successfully bind its control port in
>>>> kmod_t restricted environments without broadening SELinux capability
>>>> assignments.
>>> This really feels like a one-off hack, but it's far from my area
>>> of expertise.. Could you get an ack or review tag from some kernel
>>> maintainer working on security, capabilities or permissions?
>> I'm also not too sure about the problem because it looks like kmod_t has almost
>> near root privileges, but cannot do network administration.
>>
>> Maybe there is a valid reason for that?
> On Fedora, kmod_t is an unconfined domain and is allowed all capabilities.
> Upstream refpolicy likely hasn't encountered a need for net_admin
> during module initialization previously and thus doesn't allow it just
> as a matter of least privilege.
> Since you referenced kmod_t, I assume this is just for Linux, not
> Android (which has an entirely different policy).
> I would fix this in policy rather than changing the kernel module code.
Thanks for the detailed suggestion, Stephen.

To address the QRTR NS initialization failure, I initially tested the
following change in our downstream policy (modutils.te):

allow kmod_t self:capability net_admin;

Since the kmod_t domain is only used for module insertion via
insmod/modprobe and does not perform networking operations, our SELinux
team were initially hesitant to pick up this change. Based on that
internal feedback, I made this change in QRTR NS.

After your comment, it is clear that the correct resolution is to adjust
the SELinux policy rather than modifying the kernel module.

Our SELinux team (CC’d Ravi and Sasi) agreed to submit a separate patch to
extend kmod_t with net_admin in the upstream refpolicy so that the 
module can
initialize correctly without kernel driver changes.


