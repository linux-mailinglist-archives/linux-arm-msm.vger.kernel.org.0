Return-Path: <linux-arm-msm+bounces-113367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uFAIAgEiMWodcQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:14:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 930FD68E10B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:14:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JL1y8v5o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Vq2eDI14;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113367-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113367-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BA5A3080011
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA16343D4E8;
	Tue, 16 Jun 2026 10:10:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762FD429837
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:10:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604622; cv=none; b=SJe3DO9pNDoEAyooTmcijD7PwYT9RS+d7MCMzTwGThNf8J0fzlmcpCROhrS1gSO7yRcyK5dMjJ8ocsBH0eHx42pbSy5CpQM2zIYT2JyAo8kAGRqOkqg+f4REHm7ez6K+hpWMmBfrdj+6k9M5U1MQ7tK9drl1FWnfrQg7O0MC6Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604622; c=relaxed/simple;
	bh=ufIc8ZHUf4Xrb8lSB6Ws/u1L1tyTF4Z3lOrI6M1Jtms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtoLs5qxzSXaa75Qo0Na6VNGhyUj+eJvNBv287z9AxAECZVIAAHXNSzLx1mZsWUIJzVTf5RgGep8Mm4cQ6094mNOIPjK46HcTkSF1qGiW8Zlfetvna/h+rhDOqG/8WkFlLpgLOgfpcRHR5NhpVGT2RN+FsAsbqbHSUzpooueG9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JL1y8v5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vq2eDI14; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Lap2893599
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isNgOMfZ65NTVt8FlgRDQNF31fC0tCGiPVqqs5w87EQ=; b=JL1y8v5owgkaqKiz
	ua7YLb0l2jDRlQvR7Ja1JNmeM/T0wY+NcJPxcnJEGNV4QNbgCkraByEoOXDqo2JQ
	QA/9k7+VOVJFCl1N+0bBh1d9ruTH7ZcAlYV7ngB6dbhX6kwiF5xIK+iPQZSzU/nK
	2wawpfw2r8ah5rSQpEJDWmKxQUMAflPG6XWluusV4xYyU2KMsRyOkXQ7alkqulys
	mejl/YSXN4D5LLONspAosjS+WC/gBwB9hfYZJkyacTYFDNpQ1mAEkeyIhXkt/ea5
	+Mr4VeRyMFWq6M5FPGFAi0MfhJIGx+9/e+INzScVMpbMGtbil53xJ9Eskfcevb4K
	klNjkQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253gnhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:10:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176891d0a9so10724461cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604620; x=1782209420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=isNgOMfZ65NTVt8FlgRDQNF31fC0tCGiPVqqs5w87EQ=;
        b=Vq2eDI14NYwA3fmO/itATCMrXO5YG2dbUw5F05WYEApbyHbC+vi2ky7g8tC9RLpAsE
         +Datp3hbSe5o9xJaB810UekTqa0WZulDCzEME9LA6bOCUq5a34MyNfINwlyXUZJPATuC
         oCto4ZuECrCq6st0Mp8vOgys2om7WzU35npJZ+LvrFd+KxY3ZMOI1y+0famjEV51qDRX
         V65e4CfQvLQLInOW/VMxMuBCNhcpmKOblmjRh1RVVQdPgZmxFPxmhi+4F/UQsjiY44ZF
         HX3z5rjRza8/yHfexCffmj3Gd6Nhkml6mj890iMJLOWFqggeJkdgY4UxdwyzvqEHzDwJ
         Co1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604620; x=1782209420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isNgOMfZ65NTVt8FlgRDQNF31fC0tCGiPVqqs5w87EQ=;
        b=leKmfrHR+jz4gUa/q7xl9+5otjsWqxjs2UM1CICqvpngAFTjs733PVVMMNYJEH4SVC
         aIYoscE0v6buFLYhcUopFpUpFN5WHRfOrU7pAgl93bbxp71jRj+8RSGonKnk5rUZhBCK
         FDcz+p1LMVTzHZPrK2Zc7gM4reRynzjgBmQ5L/34jKwDSD+v2J8/j16ycwSrXB/b1Y4s
         XRwc6jNJknONGu/VVLPK6k85ocyXPbLevVoO5tcLUA4ImHWWox9YD6B64WE/mZY6zey6
         h2wNEd5Bvtx3utZPXaD8jvjvCJO0kuLStAk3JU6uTSqzA2483VKUxF/zyLnxuYk2reCs
         ugQA==
X-Gm-Message-State: AOJu0YzgZc9S4yjvLUNpOdBVTE+lLsuNaDqlbtqKgTpnitnYfIgIAnKY
	apsjMmBBDPuTicYqvyLmeRq0aLHlOj6u6/JyiedShCmHHnneL1dN5OjT/cAUZKqEO4uUH79uFYG
	rLeQWYwnX+wjgHfsClI4GetAN3WgKjpI9NVyCa24EBIBCUhee3l6m0HQVNm+nI5MEEAGr
X-Gm-Gg: Acq92OEgXVFcuCY51fb1B4saUAdkAFo0rSpQBtGFCye0fp7yUi33PIG4orQ9qBqO34o
	qTvGfHEd3x03awpYRsG53mT7OE8FAB36o3m1P4kbhqIoaZnGBS7SR30/s2uoStvXrTm5KSlHViD
	1iY7HBg2xpve06yW7hz+2Cbw8V6YvaO+PdUB1rkPYrMv/Ersf/YZHSm9qjxuXfNelwuEhXkOr3I
	ejxLjWhm6/p0HQrPz4Vt/1CvdgpbIrFmUrD4AbAv25Gy8CTNAvmEAOZTelTxrDXolYWY458Nh2G
	Rs8V1iidBrPc+R3Wx/tGWvsS5PwGzysmOiYojeZ9EywGiYsK1T8sytCpRvPbqFOmfQ+LN8co8GT
	q4Zch5tPwoiw2XD73YAOYSyd3dbQlo41InJ6FKy/UUlW/pw==
X-Received: by 2002:a05:620a:8011:b0:91c:9d38:30ac with SMTP id af79cd13be357-91c9d3836a4mr141778985a.4.1781604619593;
        Tue, 16 Jun 2026 03:10:19 -0700 (PDT)
X-Received: by 2002:a05:620a:8011:b0:91c:9d38:30ac with SMTP id af79cd13be357-91c9d3836a4mr141775985a.4.1781604619074;
        Tue, 16 Jun 2026 03:10:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0463a2d1f4sm100157166b.51.2026.06.16.03.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:10:15 -0700 (PDT)
Message-ID: <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:10:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9bBfcaZ02tG8sGNobMBJMFLmZgFBhX8J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMiBTYWx0ZWRfX0kz7DL/V3vgo
 OsXT2DNw6xgRK44ZZ9Rrprhs9xuasne8zk+TGktq63JdHJlcNqfI4+uk2FeBuNa5R7n2z5zw7kf
 CY6CmAH2sLrJdmVzvUgEMeQT0RsyvR4=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a31210c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=MUhxgwD4z-eir1BWSc8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMiBTYWx0ZWRfX2rjlEDdGfhGe
 K3gofhIHEWg4nHTqe87lEuIIpmLmVy6mKebnuoOO9fKNAlgyuBBKwSoJYTf+PEC7bLk5mfigyy3
 kA04VdMkNzjx2ffblfsgVUMH4lkY6NIk2417jwe7uziI4LsJOhaNMpSzg1ZhaxLVeTQGeS3AI/q
 UyjPCPen8Pcdzh5OW2VwYeIge7Lvy5Lc/3f9/bZ6gL4Sa4yTJiWZ8cQ5BCXcYlk3jUPK/b0ftRq
 MGeipEgVyFSTVDL8YibpU1Ww2Z1JfFcPAmldA489/Ur1MtaEr17Y5QXkkWiDwi+MR5A2XAxlk8j
 CbrAJF2jB5LkjQ5+LSOfsi4qQBAkQLW413iZL6lt8I08BPIeBbAHMmVC/n2ai1iF9UIcLl1C/Dz
 81t9T4eIVRVEldefgFlDezBncBwj3BQJOk1WQCmn8Oh8be/QLfBC0hppvBR3duGvj7pCqr7kx4U
 vZ1wT2yCWjCEMjfThdA==
X-Proofpoint-ORIG-GUID: 9bBfcaZ02tG8sGNobMBJMFLmZgFBhX8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113367-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,intel.com,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sachin.gupta@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 930FD68E10B

On 6/1/26 1:01 PM, Sachin Gupta wrote:
> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 
> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
> the die temperature, and when there is a level 1 upper threshold
> violation, it receives an interrupt over spmi. The driver reads
> the fault status register and notifies thermal accordingly.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---

[...]

> +static const struct mbg_map_table map_table[] = {
> +	/* minT	vtemp0	tc */

The struct is defined 2 lines above, the reader can tell the names
of the fields
> +	{ -60000, 4337, 1967 },
> +	{ -40000, 4731, 1964 },
> +	{ -20000, 5124, 1957 },
> +	{ 0,      5515, 1949 },
> +	{ 20000,  5905, 1940 },
> +	{ 40000,  6293, 1930 },
> +	{ 60000,  6679, 1921 },
> +	{ 80000,  7064, 1910 },
> +	{ 100000, 7446, 1896 },
> +	{ 120000, 7825, 1878 },
> +	{ 140000, 8201, 1859 },
> +};

Please add a comment stating this map is not PMIC-specific

[...]

> +	/* The HW has a limitation that the trip set must be above 25C */
> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
> +		ret = regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +				      MON2_UP_THRESH_EN);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
> +				   temp_to_vtemp_mv(temp));
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		dev_dbg(chip->dev, "Set trip b/w 25C and 160C\n");

Should this be an error print, returning an error condition?

> +		ret = regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +					MON2_UP_THRESH_EN);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Configure the last_temp one degree higher, to ensure the
> +	 * violated temp is returned to thermal framework when it reads
> +	 * temperature for the first time after the violation happens.
> +	 * This is needed to account for the inaccuracy in the conversion
> +	 * formula used which leads to the thermal framework setting back
> +	 * the same thresholds in case the temperature it reads does not
> +	 * show violation.
> +	 */
> +	chip->last_temp = temp + MBG_TEMP_CONSTANT;

Will this work fine if the user tries to set the max temp supported
by the hardware (i.e. is there headroom for max+1)?

> +
> +	return ret;
> +}
> +
> +static const struct thermal_zone_device_ops mbg_tm_ops = {
> +	.get_temp = mbg_tm_get_temp,
> +	.set_trips = mbg_tm_set_trip_temp,
> +};
> +
> +static irqreturn_t mbg_tm_isr(int irq, void *data)
> +{
> +	struct mbg_tm_chip *chip = data;
> +	int ret, val;
> +
> +	scoped_guard(mutex, &chip->lock) {
> +		ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
> +		if (ret < 0)
> +			return IRQ_HANDLED;
> +	}
> +
> +	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) & MON_FAULT_LVL1_UPR) {
> +		chip->last_thres_crossed = true;
> +		dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
> +		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);

Should the assignment and this call also be guarded by the mutex?

Konrad

