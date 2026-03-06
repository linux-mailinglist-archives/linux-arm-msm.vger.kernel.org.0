Return-Path: <linux-arm-msm+bounces-95907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEhQGi8Wq2nMZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:00:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1450226846
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFF0330180AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 18:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E341E36D512;
	Fri,  6 Mar 2026 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhckAdlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ky24bw/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9404F41B35A
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820001; cv=none; b=T6Zg718sOSKoZndscvZ7zn8D2uR0zSUxdpzcy1mhQE6K3EGh1buPLLJfEoHYkvWO8m/6PwsBND8khA9sPh9FtLows7W7iUwkd9O9z5LKXmJtsnscDGs0gO7z6u2i7pZROUwtv3hFVrzWxUOz61m4PZ9VTE/T03Kz/rElCkvuMMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820001; c=relaxed/simple;
	bh=DBCxT/2e7ZvKmGoWfxanKmWtl22WFbPpIsfuIJZfts4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r26KHNgyMy9zNdIi5QKX02IXHxfS4eT0aoD6LxjiFxeqovTLOI8eiXZxJEiyLQHdEAIHHcdEc55zSBrPvQilCyLKybc7ITUZErEiXXQOqy8O5JBAmYieA+wqPRJ8LU/QS6A9zDZcY5NI7lm3CpdixVGYxNDjbFDkjXDIqcbehYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhckAdlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ky24bw/y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1ZKA232632
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 17:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rN+Xffu/qaR90TyG6E3RJVNY
	3wxJVrmWgqtIqzPKHx8=; b=IhckAdlCCVX/ljQjR3Q11cj/Wg00W9tBzEdscgCe
	UYqthjopON+k7PE2Xuu/JmYths9sSqHy34RnKWjgr/JO0y/DpZTbCytMMGbgLNqT
	BTiduXyAcOM9ZvFR8PGiPybv9fmgaEHkrqupMJQTzyPKEP0vAbuao5zUM/91jvz6
	mAp+Iqc1XLn6p3DR762p/lqubr+6t8EAeL80xPIVT1v9CCLdVmXRNbq/HVDlv/gq
	mO4dKj1DECwk9PPt91KYrGa5rzCuV9n5DpTDQ7aVy+C25cooZ/LZErfW+WyEVxg/
	/TaX7YZiFMHWtEUlnv908eY5sDK1SExvskO3vUUhB8/Kxg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43w29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 17:59:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bc535546so7806127a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772819998; x=1773424798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rN+Xffu/qaR90TyG6E3RJVNY3wxJVrmWgqtIqzPKHx8=;
        b=Ky24bw/ypFTA5YoGUkqpg6vzlZYEAhDmk7lewafAz/EFI+/7aZEvXILhRerSJ6IgwA
         tXE4WSRIh3CGGp1DiB6gOldai7qER+X23X+stW/O9Ht49+xfXgZPUP9Ij7ub9fbURU0i
         LFosp/4TN6KuNmegYku7JtCOmGIIy9mEOgbkb6MBt3pTc6rtMk78qlbyrYGrO5G8/Img
         WK94fZRlZmrMODIm0AKoxY4W+ipdeAhQ55woeIGbcDVI4AkhVRTayxeJii3Sn95zuVhG
         iPASkGnBySCKfoHvnqy+frd5fs+UNxlXzDlZXo8W/hEXDt+Bj0oOQKSlX1oP37fc7usb
         ho+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819998; x=1773424798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN+Xffu/qaR90TyG6E3RJVNY3wxJVrmWgqtIqzPKHx8=;
        b=AWGFi/g9+Mq/9NyimVVV6OKYhogpEHR6YKOktkWxk/BlXU7Ppdm2caH8j3iNT7X+GU
         0fRSBgqLAb3Tqukft3HtYYOcISowXUvcEp/dHGiIU0rrJto15U1+t/MN4AIxVOV8Fo4L
         N3p5i/1zoLZPgyGpRP4ZlWAF2fWpMQfXEW+rE+sNk3tkgOmF9K2WQBjAtQBtTCVXFgfQ
         dOC5cLXzamr5Sogwws5Xb9NH/bEI8y1TLe6JrWCPYYC/3u2UAetasCh/BvlouIX6EKX6
         0XvfHqe5jrZKHdBYAGo75LwKW3Nz589H+LHAIs9FVEYcrquIpoTB0Ho9CcoyLyqNyYgB
         2/xw==
X-Forwarded-Encrypted: i=1; AJvYcCWAhiLNGt3RAmJXm1uocF+Ln+pnYLzoCuW/hUOg5dB6eKXx+c23kK30IYAI+TWf0LL6ifux1vqxs8BNRWJG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq2wR6V37vbC2es83G7CRzcVBiSHs2D5z3UJ9Ktkou/vSC5fCa
	2h1Mf3II4T7q5YJXU6HImo6DG6flKt4DgEIXEGMGbq1fmgdabSov69FK0xKEJIsov8IvpfB1qgD
	B1lSsopAMy7MDgCWsI3KqxFntk9rQLKn+uyaDFI0QBQV9tor8q6OaLqILgKefzXReVWwl1MTVIi
	zM
X-Gm-Gg: ATEYQzx/eT6DBdHH5Ln33hpY/dl07HHPiygw4eBGkZ55JShreUqUptAUuvkNdZMSXMN
	8tTVcxtfePC2HFtOOT05LaiD0nQfBwFtV4FFVvYEh6GDI/XUhdvipkFxBwWD3qE84K5Cz+siMHT
	WS/FF0z+Lo5kGkg1dqJgg5fGr4vc9b0iDeUFaOSbn+DAyiiFLzjTkvZBrRHXjcvXz0utHeBdd6o
	0S9slLOh3B+eyF8vqP5JFdGHm31Z0A0+Ba8dfOpwwyqO07NAteuQrybEl6YPoKWnAjYadSCxJ7U
	qsYa+BP/6QkuFUeUk0e+1h99eQoT9zudEGlpOf5YzxGlq5WnZdAjkyKNAClzu04X7Aw3rFcdc7M
	Z4zXYoMc4csHoV4csxqkiqYBDJBdL1rUD5TWZHQzJJ6iuobIz
X-Received: by 2002:a17:90b:4c50:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-359be3b9d00mr2597076a91.34.1772819998175;
        Fri, 06 Mar 2026 09:59:58 -0800 (PST)
X-Received: by 2002:a17:90b:4c50:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-359be3b9d00mr2597054a91.34.1772819997612;
        Fri, 06 Mar 2026 09:59:57 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c0154a09sm2388801a91.12.2026.03.06.09.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:59:57 -0800 (PST)
Date: Fri, 6 Mar 2026 23:29:51 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: pd-mapper: Fix element length in
 servreg_loc_pfr_req_ei
Message-ID: <20260306175951.v2ahxv53p4bq6egx@hu-mojha-hyd.qualcomm.com>
References: <20260202103641.3003867-1-mukesh.ojha@oss.qualcomm.com>
 <umnu5wui4cwe7udytn7scfgwxfskdy3vykex5hqerzitadpkxl@5wabu3w3amot>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <umnu5wui4cwe7udytn7scfgwxfskdy3vykex5hqerzitadpkxl@5wabu3w3amot>
X-Proofpoint-ORIG-GUID: iagx_5UNa4DvY6NmZNYMcio6hL7BavqI
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69ab161f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V2NRjDIt5TWjL-3IoRYA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3MCBTYWx0ZWRfX94TW50dHbs0w
 6LkqNO4VcXiXvHkMZkC6x7ukc8yltomfM9ulDUPnspkY+GwX4Lc1gHlppSRM0BFWklkNiz/L9xr
 v7CAJYXM2ZlfQM+Eo4AkFCh+kaUpIVQab5XZ9zQE03X1f7gdeepxB1Ild+20yfBwyXwYxzam+z4
 QPY7xBYSklb4EF+egSxWiXDLlQyNR2YO8thfTvh1ItlMh7tNYI3l4QXK/RWjtdq2YMS1sXDU+b2
 gUM8Al8nkZ0Res/fyOnXlu0NarCvTiAReTUekoKBYyt7kUfF0DLhTo5QAugfwPlup5Nkx5Kihd2
 AT88wUGk5HXQxsQcHCMf6JlZfCEDjz0HBlmpj80i0eipjlECNCaGMs3pj2Hi+Xwb7ai3+fLy+0p
 vbh0w5o/DlRiGYLXrPlFMoQaQrXK4V83thBLLNtccMFd8GG76dnKAdoGjk/yMKTCqfATwEWr2YP
 f2AunTeRzu3/uQvHbng==
X-Proofpoint-GUID: iagx_5UNa4DvY6NmZNYMcio6hL7BavqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060170
X-Rspamd-Queue-Id: C1450226846
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95907-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.944];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:07:51PM -0600, Bjorn Andersson wrote:
> On Mon, Feb 02, 2026 at 04:06:40PM +0530, Mukesh Ojha wrote:
> > It looks element length declared in servreg_loc_pfr_req_ei for reason
> > not matching servreg_loc_pfr_req's reason field due which we could
> > observe decoding error on PD crash.
> > 
> >   qmi_decode_string_elem: String len 81 >= Max Len 65
> > 
> > Fix this by matching with servreg_loc_pfr_req's reason field.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Co-developed-by: Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Gokul Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >   - Given credit to my colleague Gokul.K who first faced this issue and given
> >     initial fix and that was later corrected by me.
> 
> If Gokul wrote the patch, please keep him as Author and his
> Signed-off-by, then after that you add a line "[mukesh: changed x,y,z]"
> followed by your Signed-off-by.

Sure, will send v3.

-Mukesh

