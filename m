Return-Path: <linux-arm-msm+bounces-91226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JjZOiMYfGk/KgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:32:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9BDB6780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A90333009F16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 02:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516E82E6CBF;
	Fri, 30 Jan 2026 02:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdlAaDEA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzRTqTHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBCF7E0E8
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740304; cv=none; b=Lo9o+h9m2uGzOb7mizpeLuKiw4gTeO9YRCet2cmTTPG/9W3UOVeIigpaTYO3jF5oKb0DpQC/kq+5WJ6hktVM8RMb3ieWPOlecZRCk1jv6jsa280094MTUH6xplZmSJtwsXxUXSdLbM/QVTWnS63IBba++zoo0blDxV0NCcBi52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740304; c=relaxed/simple;
	bh=BfyBYwNaNKCUI11MJFz8BZKCdTnNxlfZcr0RetvwSlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ru1Zw7eo2UXSn71xHiSxowUMi1ZJVdMa9qB7uuTvcxly36jHUfyK5slTwdZq539QeldYXdkIdkjiy7D4ETaaRn8E6WAcKvWe2tYZm5GhnwWBnGloL+mLGh+NzIqwy65QZFTVdmetSyTPFyxxh+G5BIOILJV1j63c/Z1jU66GUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdlAaDEA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzRTqTHZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THtFWm3642648
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgOrTPpRiUhXd4iRRn10dbHm
	8K3qvcuMqSML4u/AN34=; b=UdlAaDEAaImYAMe6NR55CPpb7nrseC6AtxBz645F
	3yn32Nf5Js4uXtYAp0EPhOnwJtYAdsBiDHPgBpkn13xmEQ/xsOYWljan/98Ebzbj
	uihuwjek1l/9STy5AqbkZSP35LUE8xwFT7ZUYk2A3W/kVANFs42zyz+wLuxEmdxl
	3yGVP4bSV8wE6U2vD8/8QingaXirb8Z1m1KQmvWfN1qGB7gH0ltnoTM+3QKLK3j+
	cAQZLsYNAqBLrHKUh/JHPxSCcyOO8zrhZU29liPeuj32rEKmrnPEFW1x//4IdMzK
	gT3BNwSuBOiYOR3CvNP1UKNPEClpPB9AzOoIMW9DsTIPHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05sr2uae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:31:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5e166fb75so490140485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 18:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769740301; x=1770345101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgOrTPpRiUhXd4iRRn10dbHm8K3qvcuMqSML4u/AN34=;
        b=IzRTqTHZgYrfkT01fWpvbKzDFw8FeXYtTlCM83mshuYqkco99RWR4NSanKx8cks5Xc
         06mV+u7djVjeiTYQUoIJqvXrrVHjI9s6sXU2y4FDxeJ/tLUkFSbVpsiAsIvjw7UgHv8I
         OtCSymQICSR73a9txsgzie3Lfld5uAkzf2J9sKoegid93XGc8PTn65R26PMuxcPiZjrF
         xHgN1WUSWd1/iMK7Mas8th6uu0RpcVrDypq6JfXFev6/JbX5Qh5I5vmqHHKtahmCtqZQ
         VnV3c2FQ94PC4PD0nzyolmcts9XoO2xbAmGK/aL4MaO2CKcEQyqmtgW+r7HaMqz0dv8U
         Gf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740301; x=1770345101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgOrTPpRiUhXd4iRRn10dbHm8K3qvcuMqSML4u/AN34=;
        b=d/8A1OCzebljkAIWa8alQn2YUBt3j6/oZcD6qFgSFoODeTZL3XgeWU2B2glF8L4t1b
         RpHqupfj5rLoo+kd7iZQQZbxpkc9M/uc9dMxlJE1wpWrl6xknlX7btP358eOCtQU5ZdC
         R61miEfUaKrN6IZz3oeUpmMD3ntovvKsNOm5rjLU97g9SK5NPK0jFtcXg25+INHCKFq2
         BbUPH6RHM4S+VTGA2Xt7bV+Eb1u73LCiQTmcGjWEFZWNj4Qd6H0F2DX8rqwI8yh2fr+W
         RQ2uaK8ZRM5lzUw0NQryNeyPv9oHrSOssdiWP8dRDIwNr6GmzcqRcfcpO4J6u9OzvUQJ
         I5FA==
X-Forwarded-Encrypted: i=1; AJvYcCVT1n5e7mxOUSO9IjdHXMAINyxSxoI7lmuZ1yJNPtXUuJw1aZVk/aa2dG/EW+YSwJXHmJgDxS9NgDBtO99B@vger.kernel.org
X-Gm-Message-State: AOJu0YzGfnPGFn8vSahcw1xAZ5f8P0zMbdpRMHkMPlMXaTeoieEKyHow
	LDRFOgIFxSJRfkNd4nXsH+HAjL0HRYSnKUplo0pDbc42hln20AdfAcPLR2PKf3Rje6VC0uCtxqJ
	UKgFihNZwjdwYktaD4r+8GuBAsK8Y4ZYs5Fb3ozE4P5rEMkhfhl/Rl9ouTlqZaFu8eW5a
X-Gm-Gg: AZuq6aInKYEifrOX+VjQbOxfo+uccBvGKW/huBopG/bk8Xxw1Pm1BIo5eDHhq/Qv41h
	OshSn+7YU/xtUFcxPULqDOp3WGB8qtfjUBHQa/3e7lO/neLx1yqiwDknzL0bB2mNmGFeY17Cjo5
	YAVXqyv0Qh9YP9HM7JHzmC/adpOx3suvkZZgidsX6F1f0irgT6PrHEwsyUy5+53ldU3OhihopwM
	bs6ksNdeBP4iY7K6yEF7BDcw6ULgfktZni9ZBvbuQlhixqY1D0m0gm29O6wbVOfI70OiavApQVS
	b196FQ4soadIe4i8LDz75Pbr66eL5X1DJ1veFX5VeyQyY7IRco4XoJxt4iMvVlvrVe6fVycyurN
	VHE41yg+27x7vygrdNf91KuaatbAL2Kk/C3PIpxjXwJt8gY9L9OwSc9s+05IT2lP7S9+IDjziUY
	+3PqwV877Lx5Z4iBkNvT/AXqw=
X-Received: by 2002:a05:620a:1a13:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8c9eb310f3emr208417185a.74.1769740301023;
        Thu, 29 Jan 2026 18:31:41 -0800 (PST)
X-Received: by 2002:a05:620a:1a13:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8c9eb310f3emr208414885a.74.1769740300465;
        Thu, 29 Jan 2026 18:31:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c8e417sm11659371fa.21.2026.01.29.18.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:31:38 -0800 (PST)
Date: Fri, 30 Jan 2026 04:31:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855
Message-ID: <cx3yjz2nrwe6iwqorx537qzoz4qc3yefpln5ed7z3ocgeqlwq3@arj7auyyfutl>
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
 <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
 <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com>
 <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
 <ca86ca83-1951-433a-9903-a95dd4be23b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca86ca83-1951-433a-9903-a95dd4be23b0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAxOCBTYWx0ZWRfX3bWv3+wSQy1M
 +1LOScQHxawcASYBjgmmrHFuiB+aSfYBMbByBlNzrOL1OmG5cAX83humNTjdpQW0EuZNVjOWd3G
 vPd8t4BvQiSk289hR/wEOvC7ME87DRVh+1oYGPKUbOqOLfxajGTFSjBYjeamV4el7LDxhdjj0Nz
 dN1uh6SR76E5+BNHXQVNa7zdc6tJgCZ5WUtuqWR7RcqkjtVkNqf1kdC5MJgIUubVdSblql7mIeJ
 QrrGw1FHDfr+hIRRmDfYsleqqq44w3s5M7M81q819X+Js3Pk85zr1dJxz1XFbQ1+GIkUtVR8sXg
 GHFg6+1Q6GHdR7WyO4c6MSx0dJVKKA9n5GIGDPxRCRiU8z5WprY/U+MervIHDdn6Vg/efeiroPa
 l3cx50WGxpRSkG9xb0+ghgscBMRC16j/CnW/NDPm2qvx02K4J9G9JRvflFPqXYOsfOvcqdHekEH
 /a8ZWg3hShaZF7Fa3ug==
X-Proofpoint-ORIG-GUID: bjnNsWJwowXmpCJzpDgbGzSlR8kNGM_x
X-Authority-Analysis: v=2.4 cv=UsJu9uwB c=1 sm=1 tr=0 ts=697c180d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xRJYRmCiUkmOlKP6qXQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: bjnNsWJwowXmpCJzpDgbGzSlR8kNGM_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91226-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E9BDB6780
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:17:49AM +0800, Mengshi Wu wrote:
> Hi, 
> 
> On 1/27/2026 11:06 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 10:32:58AM +0800, Mengshi Wu wrote:
> >>
> >>
> >> On 1/27/2026 1:51 AM, Dmitry Baryshkov wrote:
> >>> On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
> >>>> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
> >>>> data structures to enable Hands-Free Profile (HFP) hardware
> >>>> offload support on these Qualcomm Bluetooth chipsets.
> >>>>
> >>>> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/bluetooth/hci_qca.c | 3 ++-
> >>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>
> >>> Any other chips which would benefit from this flag? If you are setting
> >>> it for WCN6855, I'd assume that it also applies to WCN7850. Should it be
> >>> set for WCN6750?
> >>>
> >>
> >> Thanks for the reminder. This should also apply to WCN7850. WCN6750 is not
> >> considered at this time.
> > 
> > What does it mean? It either supports HFP ofload, or not. Does it?
> > 
> 
> We have not yet enabled the WCN6750 hardware offload feature from the
> software side. Other chips will support this feature subsequently. If
> I add the flag too early, it may be kind of misleading since the feature
> is not really ready yet.

By the software side do you mean BT firmware or something else?

-- 
With best wishes
Dmitry

