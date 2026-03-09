Return-Path: <linux-arm-msm+bounces-96349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNnZKi8pr2mzOgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:10:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BBE240AAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 593563010621
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE88368958;
	Mon,  9 Mar 2026 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxAk/Jpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LL8AArbO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FDE36605B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087018; cv=none; b=cPHZdnm7+tdjhwxk9U3zsTUnG3x+f7fjHgvYlVGlrJ9APsiHD1hp+FyQzK4IXAMBB+TtypxuecKiYblS5d5BSRDbU1350V2hwLrrCWYBj6uvpiVNZjqGaoP4e01GoRuhj+RrnRCBmXYDCnV9qth+qf7N+6cwF8VcDNReEh4fYEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087018; c=relaxed/simple;
	bh=uVUG1X8nQTOgejT0QSREy1uOaQ1TpHG9u9jHzyFUWXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrWjJa6nBPs/OPlvk2j/gxWhP5tNYtbOtsBvvVjk4OOA665Jq+9aZCZEc91KWqYhoIfNcJ3nejGvzfOWZmX5FTu6gohn7tUFx5ApXdppYguZjWESd/IxR6NuXOrvjssBXpW9RWEo/zqlZ3jHoq1tgn2zI0wDmUcyQaxbBJFBNMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxAk/Jpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LL8AArbO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC7rK1298301
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dWiwVz3ThwkcFgs4fQusEslH
	3y0rnnNUnGOTFym6Pss=; b=lxAk/JpglZMEJWGPVm+wCrf/wAkfbRVevW8UDqQK
	ceAplReld4fo5QgSez2DxEeXJ86+wPQTpDCTwr/IJAEkxboMINY4woyNkSljcqRr
	NczwdKTB0pTPYroqYioZ9BggeAcdoxOzJNzvkRgwdNtFyA5Yzqm1nXCDt0LwVRpV
	cj3v86z2m2mjMbqvLiNT2e7sTYKMUhW18rL4cBo3hXWJU7BmRNFluaTMgfa56xjs
	gQIRswFE7AfvhVrfcML6Uy6XiumFDA2Kyj7KHJ8vGHd6g9vwqPP7GCawC30zGa7s
	L9LOiYLmwCnvFut1ZxLLBAChS6IksEXoml4FT7zuv5NkNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv198p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:10:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso133305001cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773087015; x=1773691815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dWiwVz3ThwkcFgs4fQusEslH3y0rnnNUnGOTFym6Pss=;
        b=LL8AArbOHsCzyT46gMtYgGFD5+Ung9vByXrDlzbv1lH/ZfB4OccDpvN6bFVuLP0fGx
         4PmUT1dqzDiuh0p4hMGNfLnc6cOgb22+NIwOzGQFQfUU8FRl2hEAV0U/cLvDUrE9SKuu
         fSOHN7KpOkdHWj858vr6vfCK433rfIcsu259ynbsboKo2uiC0F2BDkMSYqagzzJOwPcd
         Q4/A7IoZbjrPh2QpxyO5tRgxCPnEbMkY5A0W7dcGzRNBMt8zeEM5u5mcR73R0PxRWA4R
         ylzYXx/mmwNkYx4vmSdQRR6GS15AECeDBxtH9ZDfcidUT35UeUcrAa0Or7Hk6oGCs4VA
         ANIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087015; x=1773691815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWiwVz3ThwkcFgs4fQusEslH3y0rnnNUnGOTFym6Pss=;
        b=ajxM59UbgY4cIZVKBpbjxetqVschH/aXDlQJ0DFOKt86PYpX1wjJPredCUjxeCIIq6
         XUjoEhkiwJYcVQtFCYpl4UwH1AF6cFGky0YR12UhraSZfv/Uwvg+DzzdxyqyT/VXo9wX
         CaT9/H7MB9QYZc3+OYxFeaZbi+Wjidf73NiXNMW34+upXQ19kwERtVWjglwQPd2aJLnk
         lnkVp9Ot+aMEvwLCsC+BlUz7iivA+Yb3PzcEu68cCMDlSAEUGOsPMw34VnTL3/wBRkmT
         VJjbo6yo3uoYE4Sn//zZWqVzpXctDay6Af7XL/ytik7GQX+7x+gJvJ5eWmtXqghaDhym
         nn1A==
X-Forwarded-Encrypted: i=1; AJvYcCX3E+t/JrSeGwgWnIov1Bl6fkefGmTpY9qSihp7sfk1Zz94smZa/KsdAL2g/5g88z9dSP1Dl8mHvt8onvmv@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/PILPb3Oou4ztXgblZU7j74u9Yhp3+X4Bsn8Ar26HSLKwFS8
	Arh+AkMKntTB4za0tVIO7WV01VeDmecjX8OZEWa8/4MK4fk7z3kyjyUzRlUaCYtpKT0RChV3mli
	fZvjhxGWEGvqY4Z+z69AHwttVqzVmQqhVn8++qxm5AAZCbAwfsK6Lzp1Q/z+eYby3b1YH
X-Gm-Gg: ATEYQzxvcaAVCiusoNqwIQ5NfeajBtWIXrbmPYWfXi5If7KPjFJYX+sVMoRAt7xe5QQ
	MW8zoQR32DzDbTeARJ7xkFGEFq9DVrL50y1JhsdHJqPPfRCVJfkNl4PswJWMHlp5G0Og2GtFC8t
	SRDVNa3njp2zEf5UmhGUlURf0r+znE/FNgc+XVi4TFY7SMbPxG3Yfc7Qq4WiCegpVczUPLr86gx
	9JPyp73nBaABkCrkI2+Oq/KQnoA9NAfOrmjCwRUFYrFE9oICWRUBqpOcqMmavtEGnq6ZaVtQYIX
	0Kmoh71x7NDCa0GZMgDkt24O0fK8B4Rm43l6fpeqm7cWvm2uo1u6OINRbZrQyiQmHzw7gk1FtBR
	ch5/LFDpYq9M9uGhfiH3/qqHLzqBBtWnyW0nu5rcRIoHy8PBCBTC/LSHbZzUD21SVbQnXMYar3C
	ohlg5oTCj4ab/unLtQzImhktiUGBxbOGvbDzs=
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1559636785a.70.1773087014881;
        Mon, 09 Mar 2026 13:10:14 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1559633185a.70.1773087014423;
        Mon, 09 Mar 2026 13:10:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d0726fbsm1135151fa.41.2026.03.09.13.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:10:13 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:10:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] clk: qcom: gcc-sc8180x: Use retention for PCIe power
 domains
Message-ID: <uu2wdb3so7ht4uam5fisd6omamwjz7gy4zp75ddny6vyxwxnuj@ye62osajcmcg>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-5-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010214.224621-5-val@packett.cool>
X-Proofpoint-GUID: ZfKqk_TsUjsU5f4Y7YJ26d-88E5rGs1K
X-Proofpoint-ORIG-GUID: ZfKqk_TsUjsU5f4Y7YJ26d-88E5rGs1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OSBTYWx0ZWRfX4b/+31RBEosu
 p4Qd1PpXkgLtkmRYLDlhThto4VNeYgVhF8mb5X7LxiK+VzMSrulUzhh6OXUvoKKhKUKtfTffgfx
 02W4Oh4gdL5e4VKHH7o0dPD2d1mQ3lPNa8cn7vE2slhbqr1nRC99xzyECvSi64kHgcLwGQXK9g5
 VMAdPl/2ZxT5Mc8vUxtd/lkKQ2pvTLZtMab0OZkI2B/deuYBOm2P2mfUe0RISZCN+8kMhu1NYFt
 VYdi1Y1oL+iwYxPk50BZJ/UnUoszBiQeUzd7MjDT4pj4W9vL6phCxGtFCAuoWvPb70EiHCm8S5O
 cLWPybEeoeORuxnujtPwQMJZJB8BrJeq9+KhnwB7Bmf4+KsfHYCaxgf1yegyxsDaN4QuYkOWXwG
 /MUu6JBuLjo9GYbs0mi2xHaIkQI0wHGVIm8Jxl1XnYIAA6qZI7SNJrGfFYFzxGax3fxMZ+xzljs
 H2Q3Y5V2/Jq1V9VXMHQ==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af2927 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wNC1lQ1g-FioslJNlOwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090179
X-Rspamd-Queue-Id: 54BBE240AAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96349-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:00:26PM -0300, Val Packett wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, use retention for relevant GDSCs.
> 
> This fixes the link not surviving upon resume:
> 
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: Disabling device after reset failure: -19
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> 
> In case [1] gets expanded to cover all SoC including this one, or an
> alternative solution ends up being implemented very soon (looks like
> it's not going to be [2]??), I can drop this here.
> 
> [1]: https://lore.kernel.org/all/20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com/
> [2]: https://lore.kernel.org/all/zfs6krk2whthgdjl2s2w4o5pjwimzw37afoiyrqllykrk6jugt@4ijk5iqplohr/
> 
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

