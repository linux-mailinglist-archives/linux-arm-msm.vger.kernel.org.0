Return-Path: <linux-arm-msm+bounces-110871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QpX8OfpmH2q6lgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 01:27:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D63C632E68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 01:27:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jhdtc7lf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZRhIXIil;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110871-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110871-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C6CD3045454
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 23:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFAC3D0BE5;
	Tue,  2 Jun 2026 23:27:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13A3CD8C5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 23:26:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442820; cv=none; b=WT+AxcupACmuUChiSGZ/0zd7W+CRJYuMRqJ4jNPsYdEFhZGqIL8m7B89LS8VDU5ss/Nr6oMg5kyyQXGD6IM4wSZD4idtWR3fHkYbxSVjiZhW+kcAsRIyLEO/iwqLbH1L4Z6PFYBpRCoD+PRCxUww8/XW7zf8F2m8aUEkVfumK3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442820; c=relaxed/simple;
	bh=AyfzGk+FPNYvqu5IFJOsKSXjKGap8fO4JFQLWaJdA74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMSiHkRe7OPHSGk0L6SLMSmV/sQzJeK/KW7TvFSCyBf6OA4vCPTdaZ3Q+sqsARAzvwCXv3bax6VaHB1BkcvWo8Pz++jFKSUevQdSU7Sk6v0lIYoRUFpS9ynOZYOif6ixScwAL6dsMIuNA5CC2LQpUyjyr9Up6KRd7uCbqGOXzYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhdtc7lf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRhIXIil; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652IpJa91316757
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 23:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZM3z6XgtOJGq5dRvkwF/rhFZhGqfFrXQUUSCUIYj4o=; b=jhdtc7lfiY4JugZQ
	sUCIm3hmlGI+0cTNSD94SS1/R4o5t+O41mwrUhZY6yvL6rvRGKg9vKHzxpxbnTHC
	LWrOqmiyVtNjVG7qvILSmRMBWX3VZu+Ca4jUVoLP71n26pPvV13zzEDI1Kx4aMu5
	nwxFs+oQ5oEDsHqllzLlPgULNM3o+nhcMXttscyds+cHSh9ml7mpOBznM1WkGPgG
	T0UKrTpsD9Bs5xCcboGmS/zrR4oVcylVTfJfUvemveeUF/wHlFL8LGMBdBFh/0fC
	xgpw8nPvEsw1jbJrTpa06gojPNGnlUl5+5ySES6YW1IxxZCL7IRam4tqaaVwYuKg
	zm516A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vv96m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 23:26:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3041ab826ddso19871166eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 16:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780442816; x=1781047616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZM3z6XgtOJGq5dRvkwF/rhFZhGqfFrXQUUSCUIYj4o=;
        b=ZRhIXIilJnQaz14h7+IBXpPceOy/Ansp4dtw/aBQQEIQw1X8Kgik3Ykfvl5nOpVXa4
         KjGkQdp5viYYO+PVdjiGgOmPSzzIsOlLY4eg5j5ve6mMy9YHo5vJT4iJS8gMMlKWJODJ
         KV6doGNl3ArTFPJWyk1bcC/lFaZwJoKj1z9QHRKlSNFJnew71kZijt9EqO3lLOMYn6FA
         tu7wKDLRiacgszPd/M1YKZnUk8p8dLr2Bt4ihyX95RpT3TYud47rccKkhoXfeV8d0bvP
         Gg1A12TvCzqM4S0wg6I1lOuFar7vSot3vPkRfzyORpPrAvqwJHHq1Kt2Y54k6rMUfcMu
         Cj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442816; x=1781047616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZM3z6XgtOJGq5dRvkwF/rhFZhGqfFrXQUUSCUIYj4o=;
        b=nJ5pLQAbpN0mCibMKYEAYC6Sx2OI+lM0E22OOJ3dc1usUZ1v/OzHJQIKiY38xgvGP+
         ZFM9fuNfXH7FiGLNPWxPnHATayxCizLY8lVrLJxvJoym3+Vr9CtyNUf1+OcEpwD6j2Vs
         Ktl4WLFiUqABXK+X2juzFmJogYlUPCcQ5JNaYnbyh3fZJwaMyByoh6ioXhZkMnNPap/0
         3wRYaZQsgs1yuB6EipNNFQxDHgXxD3W5ICnogu2/+vAnof2y/GVFq1CcfTLJfeR/2uws
         PevDHp/m+4Me+0W1Xfg9j82WfLcjEiK3RPIrEdOJZo69XzDhfImOrX92zE8gJIEbDGjc
         ucAg==
X-Forwarded-Encrypted: i=1; AFNElJ9p92sbIvCfnqkzJBqTmT/Np7mySnlaLuGpB5xFL6iHyjgx69nk335D3iB3u0tZY/TFqRc0D7mJIYQyaZfE@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRiS1logSGoZ1ZM/yos2G4/CDDlcrtzXeK6aWSO9n/cBgT6li
	Mi2bs4vpRph/0r9gp3/lfSe19wTtnqkuIvdmR1sAUxalmmW9biLcvhBQ0NL5Ov5Pm57fZzQULvW
	CARGzcFO1XSlqtC5ny+eYHybsoMhw4tjQ4/Xt2MmX7noyBHc8e1bG+Mcwhqyci3QMoOHj
X-Gm-Gg: Acq92OHYV30Q9SBi6Gf6/lloNOuXsGJR0nNdI+iwKgD2RV72uQSPtE4B5Zc4BMOtjS0
	vMbJKuMOgba4g+Tx8hBXkJMNRgzO8f/UYSgvPQKO0XuBa0FqxclQIxKsGseJ8oyLkdX6BSwQCIs
	5j08paYG+8ynboy7FtIH4EfQhC5aHg5BhM89Ux+CB1JGT3vwc3zEsXUFE2XGHVEONN9/a4srhtu
	QjooFwHjrKNgJpoz02HG1DjZhVjuhI4mCbeLRHsj44Uo0hkSFskpcBZeXUSV1MqfnQ8aQirJmKK
	+fym6HcswjlEa7UphUohGpJhyaDFUwqeNNbUIDrQnIJQx4fqH18YGBXtD6IOE/SARDQpVIizwl7
	dTA8E6BqVKY5JX97StE4AezAMwXS6dfdx/o107d6oERFL9c0s/4YgyGn2HFEq4GKe7ekWxxVG+F
	XkfxDWpNSPBQ9iXA==
X-Received: by 2002:a05:7300:fd08:b0:304:d82f:c2da with SMTP id 5a478bee46e88-3074fabc08amr439434eec.8.1780442815823;
        Tue, 02 Jun 2026 16:26:55 -0700 (PDT)
X-Received: by 2002:a05:7300:fd08:b0:304:d82f:c2da with SMTP id 5a478bee46e88-3074fabc08amr439416eec.8.1780442815293;
        Tue, 02 Jun 2026 16:26:55 -0700 (PDT)
Received: from [10.71.179.79] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df77a0asm799529eec.27.2026.06.02.16.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 16:26:54 -0700 (PDT)
Message-ID: <76bb3e5b-e4fa-400c-b7fb-98f95c7a068a@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:26:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260530-mutant-gecko-of-anger-ce8803@quoll>
Content-Language: en-US
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
In-Reply-To: <20260530-mutant-gecko-of-anger-ce8803@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fg1ZgCvfi7iQfYL0QkAKlIdrb-IS2dz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIyOCBTYWx0ZWRfX1sMT5SWhVYDv
 yxxpjxaz0146QOgFmyTjcmN5O2penFQOxhuhpl3VjtYffjkSx2nN4GvET51gx4MPYvmRvTPmfC3
 0rECxzgpNS0TlMZZfCWZJCeqLt32rIpU161qxgCFAErRHmu5HgaZM/AZkmLb8TuLnFFXoYNUqNA
 mmdffu3ZsDgh2uR9elFZ/7F4810FuUGdgkTNQVHTSbP4swdYZuAsT0Cx7DdKasYhjlP1uOm7pDB
 moYktMz9wzAtl1wPTo7+zvQQlBVd/AgzaXFyk49Klw5pROIQoIUf4aViEaLsYbulIw3NyHyNhnl
 0loetEdebRRNXwlyyzzrt83nNFmTEB69WbV4meMsxzAb/5EGoSLhPy2l6DUn4L3VeS0ms72uYVa
 f8TcSd0qmP9crbldqztMsAJddFHZwPwLRQzg/4IYZkZhlRaXloTdfEXVUNDTLWouj/2A+27WzIr
 DiXRTVIwBIXEJPQlBFA==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1f66c0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ckjglDvZ9X4DQU9YJlEA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Fg1ZgCvfi7iQfYL0QkAKlIdrb-IS2dz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020228
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110871-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D63C632E68



On 5/30/2026 3:06 AM, Krzysztof Kozlowski wrote:
> On Fri, May 29, 2026 at 01:10:07AM +0000, Matthew Leung wrote:
>> This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
>> platform features two PCIe controllers: one capable of Gen3 x2 operation
>> and one capable of Gen4 x1 operation. The first patch adds the device
>> tree bindings documentation for the Hawi PCIe controller, and the second
>> patch adds driver support by enabling the Hawi compatible string in the
>> existing qcom PCIe driver.
>>
>> This series depends on the following series queued on linux-next:
>> - [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
>>   upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
>> - [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
>>   (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)
> 
> It cannot depend there it makes it unmergeable and untestable. I skip
> review in such case, please follow standard documented practices about
> decoupling independent works.

Thanks for the feedback. On checking the dependencies, the changes are
applied in their respective maintainer trees:
- clk: applied to qcom/linux.git for-next, commit d6cd9d5692ba
- icc: applied to djakov/icc.git icc-next, commit 07548b04dc36

Both commits are present in my linux-next base-commit and have checked
dt_binding_check passes cleanly.

I can resend with the dependency references updated accordingly.

> 
> Best regards,
> Krzysztof
> 


