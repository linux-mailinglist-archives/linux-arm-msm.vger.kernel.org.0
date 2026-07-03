Return-Path: <linux-arm-msm+bounces-116354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bh1mJ8nVR2ohgAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:31:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D67703E5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:31:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZdK3Urio;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZC03+r+l;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116354-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116354-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 625EE306FD49
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56D7417364;
	Fri,  3 Jul 2026 15:28:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F3E41735C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 15:28:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092514; cv=none; b=Q4umhLLfNAVf06hpatigFWCDjowLrx3mdXHTgDWGJEWED7T574QwHXWE2jVBehYGRAP3q3b85ef2GxrZ2Ktuu9y75OJz/k0Rlzi5C1d3a31l83fU9hdoiV5K8gEF3Z0OWMTT5QO2iuvNqLV6SjHyxwE5ljl2iqEcKhyLETNQelk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092514; c=relaxed/simple;
	bh=150+8HL6LJJfiLHm6ieX1zJrqRUok0x5WkQYbkbbdqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNuqEeqUziSbUMyADoHzn5dRHacZOQ59SdrsWme/piSD5zQ7SHKLHs4IXR1BWP21Re7WtEpNPGhGPMUDQf+pqTijX3U9PVqC5dPeQlE6lKkVtISMbMULf6kRYm8SjjyxmDAcJhwiJjkdy2V3ydLb1TI6aExhCbgRVj0+ta2I5Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdK3Urio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZC03+r+l; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BSVSl3054318
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 15:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AciCzvVuG7PhBcPDjsdU+1dVF4U7pvIIGAG3L/zLdWM=; b=ZdK3UriohUzLsGQr
	5AveQQAoU94llCIcFaCL3Wu8pEcTKGxM/6gPAFu5dNuw8QUzL054/shX4W9G+WzY
	2FMFGmAiIE3e3lO5DDhmkOtAPvC7pNv/4CZsxKF75AoITtxisT5n0ifqsW4nXFFj
	m+8D9MErpMheDOY3Zq+sq4fiNkdMW2n1QnHSdv3hQZWXCXGg/4n8RoN9iZp+2DEO
	wcimnjxg4wHoTQ5GVpAQYPWaIlKNa/Ipshp+3AwCd7bEfTiEE1mwnPopU/dYZQuv
	+wIeouFUfZ5nzPF0avG4nr8s8vLFsXrPhaWM/eQwNLMkLQCz00uYvFG8b5VC2G2c
	5dlJuw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02107-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 15:28:32 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59d595bfd94so242094e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783092511; x=1783697311; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AciCzvVuG7PhBcPDjsdU+1dVF4U7pvIIGAG3L/zLdWM=;
        b=ZC03+r+lY+oyH3rfvj+HwKmomPznc2Zg7DH6TNQAo0KX2xNSzcLzBHDnHf7mZ4+aP9
         ow5pzcX4ct9+U/j/Z+oAJQeJl99ADm2twM24faTVfFyhOQUae/lU6MWjpQgzQQaNL6T5
         OVCPmxOXQkz33IMtPYnh+lpy9XxXl0EY5GEicc295UAyUV20fw++ERJo12afQf0/duAQ
         G1GU9FwIgnALop/lKP4iUzYoxQfOY7Jp8VfeXeiG3bt6sSG2+ZTMqdu8V0dyDHobC7Tt
         JMfoHI6sO7etGEY4/4LFu9fYdb4QEPFcDYFqbUvCWvIUIECjYA2pVXY1J1zZBXbiJg8X
         MWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092511; x=1783697311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AciCzvVuG7PhBcPDjsdU+1dVF4U7pvIIGAG3L/zLdWM=;
        b=ICWd9DyZnf4SkSQzcP+FHBqRIvJSvoxF4IV/i4rq4qt+xK0fPbi9JJqRsnhzlHCsjB
         dC3Vc649SYWXDZjkbjEmkLN42ydWpERYV5TUrQWFUQAv6xN0TJYIsyQQX+DgWCE3oIm3
         lfAR2ctrGwCHDu70tItQMrc5SfX7oKByh64d0RYVV246g1YcckA/5j3Kg1OqhBHQH3l/
         oMVYRKG2jpCSvbFsneHtXAKsCgIbaJuMdWGMWPa9UAor9dLuTYO7qhs698GGjNC9KPIo
         VbUflZ0isCYlW9UoUdqg2ULtgFo+2uPwPUasUby5urv7VJ5KjgI+wi3HmJX1HVpF/Fda
         BPGw==
X-Forwarded-Encrypted: i=1; AHgh+Rreni8JYtvn7x6rZRvSYQfw6upnUYY3OVz/J7WSbQOb7EyzbAB13qE/I+yPjGB6k5AqhhUkIZdSlrClXFW/@vger.kernel.org
X-Gm-Message-State: AOJu0YzO9s5z1bilkyy8f5gnPPwIGxlyJNpQu21jdN/3jA4dvXEdCwFh
	CqtODPG+QXzwl2FY9CmkepOWeACb4Wz8QtmaJO+Tq4UgO3V1B3fu7zIjNVNoaqnXb8y60e4kNvG
	GoTK/lyew2lfI8bObEDo4W/eLbZ63bCBvmDDrY6YvWKvntxLXCSbNIu3BOSFmJtxIuO6u
X-Gm-Gg: AfdE7cn7zBeZERj628DzDs4tgYzW4PqD40R/2m5QlXUxJhTgjlkEeYVWewqRYMAyF6u
	FQZclwltpJRDM4uvX4d5fr4+uDRk0aJWGR/5/sy7bBdcBcO+8ZVWibyIfbbnKfXudS6BGsuiks4
	I/vKW82RxsHu739MzQLZKHW4/yL1OWZtV2FfoQ5nCM8Izwq4JSJoCjM06p4vo2rEWkn1A41lXKt
	WEY7yMf9UULOYsp67a6SU8pO1EJQyNPbZnIJe2skaWPZQxbH9N3TXKDWqKooNYex4JuU1UWUNPg
	ccrlymuSFosM83yh0ZpwNBT79iScmASJiEhIeMQ8a22ZtheVKPoyQzTMc3n2BIsF1RFHgEZI87Y
	iuh407y5UrpeGaVC90hQkK50PwV7cuhuCPseVD4owQccm90g8QECWpwGJsjUWG6yiWOecwk9Uyg
	nvpkEUCLS5/T8SDeeqdmtQUsx4
X-Received: by 2002:a05:6122:896:b0:5a0:5805:c8ba with SMTP id 71dfb90a1353d-5be1028b9f8mr180e0c.11.1783092511243;
        Fri, 03 Jul 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a05:6122:896:b0:5a0:5805:c8ba with SMTP id 71dfb90a1353d-5be1028b9f8mr167e0c.11.1783092510604;
        Fri, 03 Jul 2026 08:28:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c3asm548295e87.82.2026.07.03.08.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:28:29 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:28:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <sfilvfwibse2vpi74vownkx32kz2dhkkvriphtti5jn2p32ffx@2q4p7nahzoxz>
References: <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
 <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
 <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-GUID: sxGhbBw8aHf9kzbhE2AnueXlqSE8GI8L
X-Proofpoint-ORIG-GUID: sxGhbBw8aHf9kzbhE2AnueXlqSE8GI8L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MiBTYWx0ZWRfX+uqfbEp8FU6F
 0KFcVSxMNogNL0D7tnZAwoBKAkuIKu9fjrzVCGNTjfd1tuOk5nI/vcxIFjwN1+XrA5WPecpXoB2
 NkpBjPBpD1eeOFk7+pFo8zQ0/qA3RT0=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47d520 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DumtbP4wScXUqnNUUE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MiBTYWx0ZWRfX0h0HDOprueU6
 vCLV2pgHbuRcb5ejDqH89fEF+Hvt5TVkeXRqiXz+infe87f9EbfHo0+noF9hzNL2QIRyHYIuG1p
 1JUMwnV0lIRQVzwElBY9I03bBK9dZagxOjJn2Cr3KINzC56fWOvorEteUaswnJo842wuhAMrXd2
 oT1tXOvmYxu1oLynO4c+Ixq/k+Ri3Gb9pFDYSc0+5wmnP4OWW2lG+6op3LzGlF/DZwcqCgANwBt
 mpA3vFeJMQMrUN+LNpez8SfPzlVb3tsy+r7aEc+huuDz4RvBh3nrffK7RMhoqws27BE3dGTpbpu
 k9D6p6OriIch1I5j13xYQ9FbCAJ3O2v/FuJV1Bs4ZWAEKYOcBwLCB98amzZbrp2EeusHvus8MZL
 8CkRHH3oUX/o0BJb4bzimGSl/OylPV2ENgxAh9Gm/7UU9crnNIRw9J1J/YQEKMMu4hzsjYNOvlC
 C4y4PSDK9C1OBOscv/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116354-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:komal.bajaj@oss.qualcomm.com,m:robh@kernel.org,m:linux-phy@lists.infradead.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:olteanv@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,2q4p7nahzoxz:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03D67703E5B

On Tue, Jun 30, 2026 at 06:12:20PM +0530, Rakesh Kota wrote:
> On Sun, Jun 28, 2026 at 03:33:23PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
> > > On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> > > > <kamal.wadhwa@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > > > > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > > > > > --
> > > > > > > > > > > > +
> > > > > > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > > > > > +         };
> > > > > > > > > > >
> > > > > > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > > > > > such as vdd_s2-supply?
> > > > > > > > > > >
> > > > > > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > > > > > >
> > > > > > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > > > > > downstream components?
> > > > > > > > > >
> > > > > > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > > > > > >
> > > > > > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > > > > > votes are cleared.
> > > > > > > >
> > > > > > > > How is this different from other, previous platforms?
> > > > > > >
> > > > > > > This is not different. In the previous platforms too this is taken care from the
> > > > > > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > > > > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > > > > > may have a RPM/RPMH regulator as a parent.
> > > > > > >
> > > > > > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > > > > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > > > > > calculated based on the active child rails. This was done for all the
> > > > > > > subsystems (including APPS) regulators.
> > > > > > >
> > > > > > > So no explicit handling from the APPS is required for parent supply.
> > > > > >
> > > > > > You are explaining the driver behaviour. But the question is about the
> > > > > > hardware description. If there is no difference, please add necessary
> > > > > > supplies back.
> > > > >
> > > > > I understand your concern about descibing the parent-child relation in the
> > > > > devicetree, and given that we have been almost always followed this for all
> > > > > the previous targets, it will expected of us to add them.
> > > > 
> > > > Yes.
> > > > 
> > > > >
> > > > > However, we want to avoid the unnecessary access to the parent from APPS.
> > > > 
> > > > Why? What is the reason? Do we want to do the same for all the
> > > > platforms? Only for Shikra? Something else?
> > > > 
> > > > > At the moment, I do not see a way to avoid that, if we add the parent
> > > > > regulators.
> > > > 
> > > > That depend on the answer to the previous question. In the end, we can
> > > > make the driver ignore the parents by removing them from the regulator
> > > > desc.
> > > 
> > > Ok, this seems like a good suggestion, so you mean its ok if we define the
> > > regulator desc's supply column with NULL? And only keep that in the DT?
> > > 
> > > you mean like this?
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
> > > 
> > > (please let me know if i got that right. thanks)
> > 
> > Yes. Don't forget to explain in the commit message, why you are doing
> > so.
> 
> Currently, Agatti uses the same PMIC, so we cannot set the driver
> supply name reference to NULL. Since it's an older target,
> we'll need to run a regression before making any driver-level changes.

Sure, just do it please.

> Additionally, the child-to-parent regulator ganging differs between
> Shikra and Agatti:
> 
>  - On Agatti, l3 regulator is ganged with vdd_l13_l14_l15_l16
>  - On Shikra, l3 is ganged with vdd_l2_l3

Well, somebody tried to be too smart when contributing Agatti. Now that
needs to be fixed. Be sure to keep backwards compatibility with the
existing DTs.

From the schematics that I see, the pins are:

- vin_l1
- vin_l2_l3
- vin_l5_l6_l7_l11_l12
- vin_l8_l9
- vin_l10
- vin_l13_l14
- vin_l15_l16
- vin_l17_l22
- vin_l18_l19
- vin_l4_l20_l21
- vin_xo_rf

Please correct the bindings and adjust the driver.

> Since vdd_l2_l3 is not present as a supply name in the driver, it will
> be skipped by the driver and would only serve as a representational
> reference in the DT.
> 
> We have two options to consider:
> 
> Option 1: Skip adding the child/parent relationship for Shikra for now,
> since the DT bindings are not enforcing it. (Ref:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml?h=v7.1)
> 
> Option 2: Go ahead and add the Shikra-specific ganging in DT now. Since
> the supply name (vdd_l2_l3) does not match what the driver expects
> (Agatti's mapping), it will be gracefully skipped by the driver — making
> it safe to add for documentation/representation purposes without any
> functional impact.
> 
> So,Please share your thoughts on above options ?

Option 3. The PMIC is not Shikra-specific. You've spotted an error.
Correct the way it is described an used while adding support for Shikra.


-- 
With best wishes
Dmitry

