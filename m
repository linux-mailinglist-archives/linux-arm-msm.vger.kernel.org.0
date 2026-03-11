Return-Path: <linux-arm-msm+bounces-96852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DvqHYnwsGmvowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:33:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1013125BFAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BC593074F11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B56C2D6E67;
	Wed, 11 Mar 2026 04:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsWMf8Y/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqes2yhX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A919286A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773203581; cv=none; b=fx6IYU8qmhElm7teuX6hYfCOvv4/srmICdXNBOBPIMs+ZyLVANXzEi6GaNh7AjeZjNEuPppSdaX8evnxQmY1ZQKhpld0WijQNFx1k3W01ytku8jcrj3+4g3O6WfWLhjzdIeKwOL/VQh8ePkTqiezdOhkVOug5eLpzMs47erFozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773203581; c=relaxed/simple;
	bh=XQW2wISe65L1ehtjoQUbPB5JKhJHGzy+qx5EEJZedIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qjw9hd0VEPEffoaeZP3R4ENDocIcXNUpQoHzMkP9PND8vKJilMyEBlp0LVzl+pEt6Z4Ih+G6uWRtQBJ9k0aEu1bOFp+E9v6eN85eFxKrkE3+0dYfOeN6zpx2nVlDYdINVIr8CAXJKvGUpLTo6tr5LelgCbSRh59Ia9IyU+mXW1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsWMf8Y/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqes2yhX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJHPtN3418255
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2T1cPfBf/zkJpijxSgq66MMx
	Sw8L+4X4CczkHlYlAOU=; b=YsWMf8Y/hh9ZeUqgqbU4oY915MWqH0qp4FDOihRj
	cLJlGUeNah/0eXll2PDuc2cnuvO03+JD7mn+8njGABzGbaBQDrVCm+w6IGpWU7NS
	GFjC80uxmqxbi0Ceyrfa28bEYaBTLp/yphuf2iPy6lE3Jgz4FufWnwyCgXM8exYR
	jSYmdGPRdvH0D13MpNw3MkeX38hFSh1VOXi3mQPNmDiPUFOSOGQlJbOy4n9P/Cto
	MFB9cWHxwofcYbxtkrVtFo6OFr1F/T7JHroKZiHVXNgw1fNKzgxbI/5XvmiZhe1j
	PzdbVDQ7PLR3NpPBoLimKPsEy/TL5YzVztfUEhSYbgtwPg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2bc4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:32:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffba307845so5379209137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 21:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773203578; x=1773808378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2T1cPfBf/zkJpijxSgq66MMxSw8L+4X4CczkHlYlAOU=;
        b=jqes2yhXkqQ5pXg511hsnZAkfsj0nRvC+rBXwfBgzF8x03K5eL4E7mpd6EIbbphqcu
         FTmjTBea9hObUXWgRW1uzJWBufxcCCTswnDBoLKQwMKleZmkZO1zEiGatBXvKsRVwcUP
         DrKHBnEbwiUL3n8uSUDebikCeYQwbS4OEidrSNU4C769DCugVejAeKvPHDaMiL25Me6D
         ruw0OQQQxFO4wD6usvBkc8aYKvvt36wFuT+aWghWnM4wBGJNqejTudgr5N4EK+7g0I+P
         6W3DFg3tYX+POtR8vkyRup8FqilnzqrancCgYPOx4dsABtwqMep6Tc3OdAbnLizQWrQ6
         Z6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773203578; x=1773808378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2T1cPfBf/zkJpijxSgq66MMxSw8L+4X4CczkHlYlAOU=;
        b=EhRheVBbNx/uV99tQY3byrwu1mmQxOcntTSZYRDAGsLsW+cOzqhWz1zWxuv58WksTq
         7T2qlKcChjeeWW2GzPtO4XxPLxXKALAbgG6kRHXKk6CQNx3ixyC7Hds95FTdOKYGiwRd
         C2jWYtjRsPDlhFCGz2f4xyjiVZ1JWPyJTNsRJ0oSM7ToiPCgI+alvXLFIGTbhFJi80xP
         6JB8qo1EN2AvFTPK/Qp6ZK7I7Bc6MdzeS/ok5r43kH/+BMkF7/43toNuytGXSf3pY46R
         gj+3iKqOgUipPhmEdzSo+AX21Mdb7gz3KQCof3pCnTqLoqYdo3A2v6tX+r40ewDWEzim
         repg==
X-Forwarded-Encrypted: i=1; AJvYcCWNPvV+sTg/Z9DjatTbVHMKh8yBLm/mITv6llAcF55V91esCQiP5twZu6rqL7wEFo8OCfLzNaG1AoidQf4M@vger.kernel.org
X-Gm-Message-State: AOJu0YxbZAF5sPzs8jgxAWFViQwZSF35tOrRDJJVk5iuwvkFJjuZz83e
	LU0rickmMER+0URGpaoyK3fIFJNVBEKKXufcxhQl2I8TMdK1BYQ7MA1G3Uc000UjjarClJyNJRB
	nh0hpZye0DSy9TbXIIeBqrnfQnHM02NXSuJnlwqXgGv+HObyw7ys/Rp+3Ku271WvlxbNt
X-Gm-Gg: ATEYQzyJYQJvHBxxP/cmJJkXZEHyGvlRXJaKUqjyARQ54hp2Ge6DzzuO0SQXUk5sgkI
	MiGAgZ+0Mn+lOZnSfQ4VlC7cK9PqIPafQ87hHzfi0WcnHBorCGY9jTmgG2gg45GZFdXaK9bSb+l
	YbsUCnKSj/YhXdhbTixmzsAne7erjptQaoQy0xLnNAAul6zHj450fTIe81QwPQRYtVUnq/1PnF5
	/iV+2SElyYN6PTQiM+xSwkDqnyDVeZuTRfkdHzr99tQUgbIU54gYVnCcA3CjqPXunAlqpmWAJkb
	kgNOF++JXmDdCicCUXEmTHKmRmZrL9W4zckkxPIzxY0nJmtk5YORtC7fkZUfJEGbp1ITlItHoaF
	aVro/jCyxmDg4FCw5/PPCNOmcT2hkp54HqyK+ZFglxNFVJldev6uJrV01xFTKyPT2LWxeiwwGUl
	87J3/nk5pJhjKyw5yhc4jnxkRFMUNchEnxMRg=
X-Received: by 2002:a05:6102:5123:b0:600:1547:967c with SMTP id ada2fe7eead31-6003a52c237mr2604004137.16.1773203577839;
        Tue, 10 Mar 2026 21:32:57 -0700 (PDT)
X-Received: by 2002:a05:6102:5123:b0:600:1547:967c with SMTP id ada2fe7eead31-6003a52c237mr2603998137.16.1773203577436;
        Tue, 10 Mar 2026 21:32:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d83f9dsm1841551fa.10.2026.03.10.21.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 21:32:54 -0700 (PDT)
Date: Wed, 11 Mar 2026 06:32:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine:
 disable wcn6750 and wpss
Message-ID: <ogn3a6chd2s6ys5voxktnzyldoqfmytadsavvaku5ym22yisyk@uvpf7ax6wwno>
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
 <zutya6ebksaqkpjen4qb62kit4lgannbfbvvfie3bpzbf5cgfi@v5xbzjuf3tyy>
 <581ddbf3-e79d-4a25-956f-7045c09a22bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <581ddbf3-e79d-4a25-956f-7045c09a22bb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0f07a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=e8xkPcqcNpPB3ZEPGwMA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 5_lQO0tEHam29OllYR3tS-yY8M3RhbNr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAzNiBTYWx0ZWRfX50KD4Te8lL8l
 lQRAYUH7aLFZJw1OWM/3mx34JlswUpOS461QfH0ph+IVwVVcZy/kMovU6Ysd7TFZ2LKa2tIniGh
 kbaUtQJjAv82HDGfbmZVQCu7n8Gsjw8HfhiJ4KC+wUL+GgctSGTf8XslQirxvnL5SHyZTRZyPKJ
 7p0wMzTpZegPyVe23LDAvdq46wcQtUy9PSIbDjlBbS9hQnmmzMd1i8dXB7Z9PSVWtsz1oJvAtet
 zMNtyj1VLcSQButOQqyvP61BRcDJ/hUdQ67f5MB4wZUGCXnXVPUqdmO01l2xtEaGCS5md453HuZ
 QdIiEvU4/KcxzkJTog7zEeeZ7rHejK1fw34emL5jzt2gP0dSqWk5C0mOX6G4xo4Pc6oK9y2KVbe
 HF62jIH79uxcipKYoY35AyKyOXiDbnaZAy4JhKKxiux3OMvDqR4B+LWxVvxRNaL+08/tmH5vN4x
 R/YulFFkUBGqq3M297g==
X-Proofpoint-GUID: 5_lQO0tEHam29OllYR3tS-yY8M3RhbNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110036
X-Rspamd-Queue-Id: 1013125BFAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96852-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 11:14:55AM +0800, Hangtian Zhu wrote:
> 
> 
> On 3/11/2026 10:40, Dmitry Baryshkov wrote:
> > On Wed, Mar 11, 2026 at 10:32:19AM +0800, Hangtian Zhu wrote:
> >> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
> >>
> >> Disable wcn6750 and wpss on industrial mezzanine. On rb3gen2 industrial
> > 
> > RB3 Gen2, WCN6750, WPSS, etc.
> Done, udpated.
> > 
> >> mezzanine platform, pcie0 lines are moved from wcn6750 to qps615 pcie
> >> bridge. Hence disable wpss and wcn6750 nodes for industrial mezzanine
> >> platform.
> > 
> > Are they rerouted on the mezzanine or should the user toggle a DIP
> > switch somewhere?
> It's routed signals inside of SOM, no DIP switch changes needed.

How?

> > 
> >>
> >> Depends-on: [PATCH v4 1/2] arm64: dts: qcom:
> >> qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
> >> Depends-on: [PATCH v4 2/2] arm64: dts: qcom:
> >> qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node
> >> for PCIe1
> > 
> > ENOSUCH tag, please learn to use b4 or git-send-email to define
> > dependencies.
> Updated with lore link.

Nice, but the tag is still not documented and isn't used as such. Please
use standarard ways to declare dependencies (I pointed them).

> > 
> >>
> >> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
> >> ---
> >>  .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> > 
> 

-- 
With best wishes
Dmitry

