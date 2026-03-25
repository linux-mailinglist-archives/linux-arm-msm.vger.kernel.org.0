Return-Path: <linux-arm-msm+bounces-99824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKcEBW66w2nUtgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:35:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78297323144
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2506E3020FCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C2D344DB9;
	Wed, 25 Mar 2026 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtRvWoIZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fI8t5UNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7C53451AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434234; cv=none; b=qCj835iQ1kJBXgQKxSENCMjIGyFajNyAn959iAPczlFev3ZweayJRU8nEc/94U3tCF9wk5QPZYoWhPbNPfaGRWfiUWFEt5GeF6JuviC+5ZpQeiDguD7ivZWvLoi+iI/cozQTmUIlR7UfhW+byHum7DLJJDWMt3NRrp95wPmb234=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434234; c=relaxed/simple;
	bh=tiugVCApbLnreQybVLzJSsSQbksTSsmN0ivYj7TsXU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmWSx4YoPYcXPAawa+71PbknOl+nhn2V0IbQDds8Bw8xfAGPqjRthbZ27CGTbSnlVTfgO2Yx5PkeCdXycX8eRr1at65C6YKlLRoygIbMtZpn7VnLXqYdL11DlnIqKROhrcN6uSqTZAAI0TJHq50GPyTo2lXjEnoAEdpHjGZ4hvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtRvWoIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fI8t5UNM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5A3Ep2075400
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9EdSi7+IKe5aYDc3/lI8XYHiIIlvxsHXy20MZv5RDQ=; b=ZtRvWoIZzbNPKY2d
	6F3mUleJTLJe95l6OBvmnaX9USdBTdXome/Pzc/CHuFzWvuiRSflCDaUZkJy+BKZ
	4bSXpq99PYefbrDPaIfTjlpzX6uhwA1QtleHCLr3JaGhLWe+5HjTFw2kVmGNAU2D
	Gz5g2A+smS97eyRQQMhIGWWeScmTqsamu5cgt4nTjPy5oSthabGvYqt/vCEFuf+h
	fPvoYR0P14DhBCBIpA1NvorsQT8OkfAN7Qk5JuGcevQb2WRs20geo5R/ZORQAm0Z
	F9lS88wjeCUBMczXeOxm1F/ZPnQCWNOgwDHVxRYrRH5nvzJT4cZ+weDFkgDsDy9r
	qCUIiQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41412nyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:23:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0ba59a830so5343894eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774434232; x=1775039032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r9EdSi7+IKe5aYDc3/lI8XYHiIIlvxsHXy20MZv5RDQ=;
        b=fI8t5UNMtUFbRWfLmDU4QHtOnU8oLOnt5pjN7Y6/udUnMtzNiOqcval/lby7hEvvRP
         sNiX+VtwkVLI2H3tEI2vIQEXrXef4wQ6YigbBFcFmcQYc5dZfL8u9lQQ7WNb41QVapG4
         tnv6b2RJbpGA/GJa0UGAF59GcJ7J5zpY8EG9FrJmNCqjITyRA7QI4Nty/OUkrSYVFoYE
         5gTojUZqlGxZRFyEDullsdNFGaPAtsFRtNOOQDkSEJ1SCfdpbKkN59nO3o0ArUrYRw/m
         EkX6fUiw6S4ImNYt9frcOm40MgLbIcYu3YblYD/etTWQLZcoECgezbbxxrW7juWsHYuR
         J2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774434232; x=1775039032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9EdSi7+IKe5aYDc3/lI8XYHiIIlvxsHXy20MZv5RDQ=;
        b=lxlg/QdUT3fVucQlgWoHgD93LU8Exwpg6QD20cg6SYpGQRE7F61cI+PzbaAA/PHSAU
         tapGBTFqXQP3G4gntyNjumYGLhwlMmmZcFMKjrtdc/boIhuvNLue2Qk86Fvo7qaes1ut
         851FIpwJPWgxf+ffDgEqmNCubP5cpU6C2f9QSyMjHPMtgTvppQ0xq0o4JmXxaRzocSBY
         kCSRiAaIvncOl9SDcfHflityrw8AHuekkhabTe1GOd9rhjeHfG8EtJ0qfn/Z7taabN1M
         j6MXPWjxxvV2MQXbRQj4dkqj+uDFABOtp5TRE/6qFX/Cb3YUpYWGVDEbsKy4a8G3GufG
         zs3w==
X-Forwarded-Encrypted: i=1; AJvYcCVU0lGMXE6tsNSXOUdGdVW+Q0TWnZi484wan9UszlYoK9rEWnRdcNORmql0NX7/tYUX0SNJ4gkC0JbqLm1S@vger.kernel.org
X-Gm-Message-State: AOJu0YyPlPXCVvtUyeR2O5GI+buuXiuT0NouPmrZXARDUYxUKPEDzeyV
	FGxleeDny1hVmR9Ddm4rasPyOBS1e1feQsWIZRkYG0OaMrnmopU9IB3uldlrYYp/bEIOzzuiLPc
	Hqi9OYgAjbOOdBQFkRFZB5OnItRoPD3g1gfWPf5Z5dAgoI7X1rlBruoD0R7wrilevsGGI
X-Gm-Gg: ATEYQzy19J3SkGM3hjvihCqBHPYdlK98dtK06bgWwUcKp5J404LldFfFDaLaXWGcIen
	G7GVpDTXD1MB6B9suLVT0R8gs1j4iSVC0fpjsyd86onPaHsQ8CQImRAJWjVLyhM5c7LQt40J9H8
	SsE1lGsN72HQhNkuUaeikucj/7VNkv1sQ2ZeAjRGrs8kk3xH6H4sOlS2jNUfuLmFYLZOC1k+hm6
	WBILpksWLNhjBMLxfPQadkbrHZE9iwGR+TuiXqPydn7Bct3Xg+xAXaW/eZIbTT2pwTQgJz95jpt
	jJ/Pb3EOYRAV7Ck3bwYwnxmvyJL5NDLyM6lVdOeAgYVc0pBKW1MovHxrnu2uYnpSLQd6gCaYqcL
	JDCzMzpNdqdG+fYPWxT0PnMFSojprmrZWKdLYUC3+N6OI8auexYbb6lT/UQlb78SA6LZga6ZeOT
	7L
X-Received: by 2002:a05:7300:fb87:b0:2ba:68d6:47ae with SMTP id 5a478bee46e88-2c15d3f77fbmr1590198eec.34.1774434232272;
        Wed, 25 Mar 2026 03:23:52 -0700 (PDT)
X-Received: by 2002:a05:7300:fb87:b0:2ba:68d6:47ae with SMTP id 5a478bee46e88-2c15d3f77fbmr1590158eec.34.1774434231682;
        Wed, 25 Mar 2026 03:23:51 -0700 (PDT)
Received: from [10.110.10.38] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17d1ddsm17511082eec.11.2026.03.25.03.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:23:51 -0700 (PDT)
Message-ID: <e779ca66-c927-410f-b84c-54df6aed5913@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 18:23:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260324023016.3889062-1-shuai.zhang@oss.qualcomm.com>
 <CAMRc=Mf4gVhwUZ8t1jQ_ohX9dfGcAX7ay3WGZP+LmsTM87xL8w@mail.gmail.com>
 <CABBYNZJciviNAL_n4ce+Ncn-bHn1utcBj4VVJGFhpYMRZxrH5g@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZJciviNAL_n4ce+Ncn-bHn1utcBj4VVJGFhpYMRZxrH5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3b7b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LITGez8UpPA1zbsMazEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: drgIdjJAkovoJ4XT07kntAvQS9eItAqj
X-Proofpoint-ORIG-GUID: drgIdjJAkovoJ4XT07kntAvQS9eItAqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MyBTYWx0ZWRfX81qa4i3O0P41
 zIcqDmC73+Cf+wKXts3mtnLdW2q4iYyI1oRSWeWIpkntIzOB+f3GhaiZC8oTP5xbiR9J+3TcyMO
 Gkba141jdDpES1ruN+cR2Ra8AQZv/IUzW5jPQ+i/k2j3LTri0oiljd6FSdbtMyBx6/DfwUuiuhI
 gepoxxgFvWAygc4XHKLHsTvHUEYv5mMCVBnbB/SbuMRLQ6wpNYtaF7sJQzBLa0sFgxiPEdd2OOC
 KcUcwDHQkt7KCm+cl8WCmPwhT5+rs8oheDeshiSKlxct9h3jG6YNbmGIuFv/5DOYmTahdjqPy9a
 FiNchQsEfviRDGuPJdjwj70p3bRawdYxYTy6xe6AcOg9HIVAvAY4hZSBV83iQc/Zo0Q0o3WUkc9
 PRiRu/a+qJY406UR+WYLi29Macf3JAF6jVejU7XednXHZSwOMP4Pmvb13EIqbxKfd29Mf39hnK+
 m3Su5JWSK2BKxirv24w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250073
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-99824-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78297323144
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luiz

On 3/25/2026 4:01 AM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Tue, Mar 24, 2026 at 6:33 AM Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Tue, Mar 24, 2026 at 3:30 AM Shuai Zhang
>> <shuai.zhang@oss.qualcomm.com> wrote:
>>> On platforms using an M.2 slot with both UART and USB support, bt_en is
>>> pulled high by hardware. In this case, software-based power control
>>> should be disabled. The current platforms are Lemans-EVK and Monaco-EVK.
>>>
>>> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
>>> cleared when bt_en is not software-controlled (or absent), aligning its
>>> behavior with WCN6750 and WCN6855
>>>
>>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>>> ---
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Let's check if the following is true before I push it:
>
> https://sashiko.dev/#/patchset/20260324023016.3889062-1-shuai.zhang%40oss.qualcomm.com

The question raised by this check is whether |qca_power_shutdown()| 
properly considers WCN7850.
WCN7850 does not need any special handling and is intentionally covered 
by the default case in |qca_power_shutdown()|.


Thanks,

Shuai


