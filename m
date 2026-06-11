Return-Path: <linux-arm-msm+bounces-112692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FYyTOeqFKmrYrgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:54:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C3F6709B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:54:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jyGmsJE7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A7Kg01kQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112692-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112692-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DD9C33709CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741933C5526;
	Thu, 11 Jun 2026 09:49:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767F3C4175
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:49:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171353; cv=none; b=fEpTMomnmy5soUU0LbcAMx6vwsaEB60xJCry1bl98KF3QkdPDA7lI+Lh86R1y3vk+mUVk1ASZShAolJB/p2uJS1jB9WSbL3GYchLWMvUjQwYkvYuau5NLJzbHS5myAvy3gureWlhJy/S2Ke3OJQrIJMnMjlEXxHTNa6stCVhgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171353; c=relaxed/simple;
	bh=d0T5kP3LL+kfIxqV6/dK/GXb1lMjqJJIjQZkzPC1N6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9hAlQsIHuoA4+Bm6iVQ1sVCv/zeRSjmn+b/6QDw+ruOcXRlUZAbS5yEE32K8/IR29C0ENw6gDutZuKrykQ2Zl8nIk6oQxZeggO2nIRn4ReQ6qE1eczVm9gLMJmbPSZet5MVK7sWJdDofMJXC+4qHW+og8t8TJB/erUXSk0xPWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyGmsJE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7Kg01kQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GFbg3791624
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3i9DKlQbhqJ2Xx9GXVi37yT+grS7XDDKX94F+vmurL8=; b=jyGmsJE7vj02LXJu
	IytJR/lxSUiq7a/P/VGpxWeJ9r1VtoH2VomkQTCTssOOJyIgLHqzXQzJLoEbuxDP
	WhtO2L92WX/Kg7YYTmoNbB3AAngiWtq0b0LP74UV+lXBhoRbmZd/ZF+Fbd69AXQ8
	hLpfEyJSr859JmCpqdrKS9kJY3PS2SAV7VkJwB5oPr1RhSJ7oePauTymMY554SFN
	RuoejhLNN8y2fBJfucCsnNCClmpS7snl5ApPkHuGOE4GqBA3IpI9BtIi1N665hia
	D56R42navWm9DvWv8bQe/JZcpHxGmT9xE2DCVTO62HlIcyf0qCIkq7Ac9tSOUorF
	fm7EAA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702tjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:49:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c857fa2706aso3371352a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781171351; x=1781776151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3i9DKlQbhqJ2Xx9GXVi37yT+grS7XDDKX94F+vmurL8=;
        b=A7Kg01kQsOnoLcMxUyGWO8BOiNfTaR0hiMeNdHIdE+w4pR64rgQb0EjBX39jcive3Q
         /6jHrdM9ah59kauGrosRZtxmFzbF7H9Bj3Kdp5zD9mEsWqpbqtrz8TGoqPFaX3gokpSe
         +IVRpprJn92OYW1uP0wuUP21ACPGSw4op2yEQYlol9BNbt9aL68jehPyzS8HzSt46yG3
         HhFC6pJso8DwLjqLGW8+tx6lYIxkoLH8vcGofaDqVVpzroQWigBgNaJIQiNFEk7+srZV
         Y2g8nFuG3NVjFm5XKufcXWEibHw9F+JO9m8oj0wdShc3ZGw2mEPP/YLBfd9UCdj0AdQh
         erkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171351; x=1781776151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3i9DKlQbhqJ2Xx9GXVi37yT+grS7XDDKX94F+vmurL8=;
        b=ULcNr/jm2uhvh3QJTDQVPrFYwkJ1zpqWGYuOsbVOcDrO9RSMAmVh3H4t4Hm5GvuKE0
         zKcfRTofH49Xc5KmayOxcYF0AxcoCLXruAx41AXjnG2m6KutyljbGtUleWswa30SizaG
         0ONRK0cEkGOaGUNfO+yqBKHmRdawfG4e8bZ4RdDjbdZYtpSAAOHUx7IajtKzCNcRNgmq
         KTW0B6d0/qsx04uMo87duBaJM3XviJexdZqavrqoVMniSauSsKgRmxq5yuDHfxeB3Tw2
         OSFs1UIBTyxegKF3viMuY2tc/vgXCdnHTyI7t6EE65Gfu2sqNOdk3If74gGHx/lVxJuk
         TRQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/y8K6MZrROzpr6R2PN6Ntn39RhNDYDb+pcY0oEXsJXCX5cKPknar1+RVn63ZodLuCACdVld0ELrVOtHb7p@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Ap6l6pm8JXFeJO+qDvgr9nBRUxNKdF920wbRKlKi0J+TIW99
	bxdkk4D4RgMUUswKk7GHsJumPjyZG34Wa5OXmxCh7TTox6xIT/CgMQm1w7KvVhpe4APlMQlJF/5
	PqAD8UZWcPKve3tsYj+ym6dVknQJelOOy4MdwOuVX5p7VpIXYJBrv88hHQTrFIyOXBTKe
X-Gm-Gg: Acq92OHj3i9z2EZU42ggwUQy60bEztWT19Z0myoeXf/c0oGQIDJJs43mplaOt4qDTr7
	s6WjuYCgjFiefotAqW6tNBN2xb4CwaxDVmFpaqcvc9MOQVAk2F5hJ8C0I73dGTrsejg4zULdVOV
	tf4ZKCtp9ccinJtEO9syp6GjtECr0vvbsCta/u6S40MMLx3T7Ul/Ms6dW2T3OWdK4ETblyu1Roj
	f+MPFVJLMu7S89yEdgf8pFMU8AiwS0Cgs3cuGspuFf/PiD06OS54k14r81n2gGVWgKHYfNVrYVY
	xIOnV+iBZOj+91sugw0pQiWRBsQvitW7B6n88bzW41LiiPTgNxepVrQ13A2X815eS3OB1NdFofS
	6szYblGSziyRWGYf1/13h/aeyG6G0r6pcluRHizNCcYE8WFpJl0y/XI9h5eXvPSU=
X-Received: by 2002:a05:6a21:7d04:b0:3b3:bdfd:762c with SMTP id adf61e73a8af0-3b5e3200915mr2484922637.17.1781171351023;
        Thu, 11 Jun 2026 02:49:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d04:b0:3b3:bdfd:762c with SMTP id adf61e73a8af0-3b5e3200915mr2484880637.17.1781171350373;
        Thu, 11 Jun 2026 02:49:10 -0700 (PDT)
Received: from [10.92.167.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86585a1cf5sm1354184a12.4.2026.06.11.02.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:49:09 -0700 (PDT)
Message-ID: <a62345ab-483d-4201-be41-a14f5f44690d@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 15:19:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] crypto: qce: Fix CTR-AES for partial block requests
To: Eric Biggers <ebiggers@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
 <20260610-qce_selftest_fix-v1-2-1b0504783a46@oss.qualcomm.com>
 <20260610184610.GC1158828@google.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260610184610.GC1158828@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfX6rK4+qCCnq/p
 C1Y+LQ0dI2A4xubk7NvHprTc8teMVwXWsscc8/sjKyW5LZKbigBLGZHmK4GIesKkIssTgRHTi/W
 PpOtkh6zXFU4j//ck6Fg2etQ5529j9SsmUI1CPOvLlUTDotF+SilungupNvEd/p1GWDlz/rMkqf
 iUPzPtlaySjyjPWRdAuiKb1ppgwZY9eIEVSyC9dWJ0EQ9Vs/vUxo7avEAYrf361v46maVEqxBWn
 nmEB49sIOvReOXDUrYW/TtUUsgW+mSi2g72xkzADFZaPnLqTQzjS1gHtGLUKZEevZctRhxWA4uD
 AVKNdib+xomR+H0W5TjRmfO+rSKyrqH/YhbVLJOt0YWdi4kN2Gedy7kU/namI0S/7L+zNgpeB7N
 cZ0ecCyYE1viU1G2/EbSmbviImPc+NhljG83NL9A0cX66jSSxe86R1BC7FZm1I5HHPggCrjSQH2
 lkB1S6gt8naF8NYkz+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5OCBTYWx0ZWRfXy1XILpqQNcuA
 fyHd8B8EUllM21UGBSYCIeXOr23AS9i5qZcYVVrLNzaTXUpbTfw/dpMmP5uZz0lB33EyqqJRMR6
 xLvNFc+d6vw9q/o3aCzQe7/Xufo4XA4=
X-Proofpoint-GUID: IuxwAwliskV62yLtZ-MiQWFEO3NaDnYI
X-Proofpoint-ORIG-GUID: IuxwAwliskV62yLtZ-MiQWFEO3NaDnYI
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a8497 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=HjGwlBrXPuM9SlVP364A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-112692-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:brgl@kernel.org,m:thara.gopinath@linaro.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52C3F6709B1

> This fix isn't Cc'ed to stable, so stable kernels will remain vulnerable
> to this bug.
Sure, I'll Cc stable tag in v2 with any other feedback/comments on these
patches.

-- 
Regards
Kuldeep


