Return-Path: <linux-arm-msm+bounces-97576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FaJIrU2tGnTiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:09:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 93181286B49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D9F8300253F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD29A3B8931;
	Fri, 13 Mar 2026 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctt2n72O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPWt12Je"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5E3B47FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418006; cv=none; b=OjZz8kXoJ/O5P0GyH2p8lGZ+/FzKqBdgyugBTPD1wiPBqah0M99CIb0MI3rfrUone8/2ZbIp/NKeZY0T4dJyRnTboWC994gt6fxlqtSxRWdq+wH0SV2OschNG26LwuV9u1M1Qo5W+EpmOYlMKAJH0NdxkPVCPeAX5qW81SgioAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418006; c=relaxed/simple;
	bh=XDzpKOsRfjAmgNfBlZ75TWB0/RZDAqgkCir2RdKUkk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2FFmj5h1IQdkPHtySwXK+hn/2w3MOgVoasmPdMS1sQUwOMa4zabjprn1nR9m5+W5G8OuNbVvUJffAwMkrSaWd3+mD1p7ETMg3wp/FdBx6ltS4rziyxj/l4/fCtLS5DkINQMIi8jWQbP8plO8YUlbmCO2pbjsU9qMBzeDh9rw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctt2n72O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPWt12Je; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBgSeJ3229896
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zzoiqEK+L9LoKeSCfNcVbIY8
	7RnJDltQUh4LWr64y04=; b=ctt2n72OeYpnwnW6cOIUh/c2xfXf8NoyaVsNYIp5
	GgOGvd9hLqxpc3uM583dOd7DXwD3P02TolBAV61SIoaN5j94gYNMq2+b3NjtXBWR
	G9dqhMuL+EmbokC6K7Wz02Vihrtsvru2BQbKJP8m6SYGva2l9rLvoXF5ziJAHvMa
	PqRJeW6THNuIJvPG9KkiH0sheiyV5woJrCtO0sM9JjXtWPL3GmW/4TTO+tTJROwH
	Yub4G1izWzC3GGrnr+uEau+6EPhB05sWBp9ZHD+lhQe0QzKc7jwHv5oheRat+3HB
	YKRnoKDa3ESQ2fPkhD9rbvRIG0bnOJM9syWWHjm6hJspKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7jvfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:06:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso135131651cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773418004; x=1774022804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzoiqEK+L9LoKeSCfNcVbIY87RnJDltQUh4LWr64y04=;
        b=bPWt12JeZDZpmJ/dTO4y0ZndVxQ2JH04GH+lRX757qjohg0ZLiLqQslK4wKfWnEB9P
         +FcumWJQpCAOfq7mP9v8VeAYX9YtVh99X7WjZy/OfyknCTWt1nDF/fDUHM1stQkfn+fD
         GpwuHZESThtR597tUbltxccyGpBvhQKaUwn++sZc+IZEwZHgpmQuR/RUunrUyHLsXe6n
         wUb/IC7gmZC/53FwcPzC+LssglL73wytV4WQEUa2HvohyYVGOkvOQuLeVA8VnISVXRnf
         s957xxpu7OIapEj3wgEWGa81oiqgppdIvVn5va73Usd3VXSscFfTw8pOPvSaWsfjqFV7
         0RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418004; x=1774022804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzoiqEK+L9LoKeSCfNcVbIY87RnJDltQUh4LWr64y04=;
        b=VtVxbjd+DNSQvJgJIufg8r4hhSJerUvZ9r9d9OjHfKbhJYU3IR/sKleXEhwKc8yi99
         +iB/9WTl5cv/YxkhWVrBJt8UOrRS/meTnLIqrAeJiZZwVEZa8WV++d4z0VcHWS/839AR
         5qJPL77cdz5OxFYI2cHqm7aOgErpmzdzrrXlneFjMWnPChW0s269DFsL5KBHkwBsM8x6
         8YXrDGhqS1QpmnWkLdMa+jHa5hmKpU9Ld7IiRjDOnocsB+NOhGShn5VgILFOQveZGe4l
         tPfTuTfaEwTVa4IJ0zsR6ReOSkI9ZHyLs/Zncm8aGI+bmXuOQ3E5MYdmW8MbjHE0ND8+
         me1A==
X-Forwarded-Encrypted: i=1; AJvYcCVUQpGnh/weKf+UH3z27SuuYLie0n5niH+YX2aTBOecTj/4xkrriCmCNyIWWhiL1FGhGiXNSFTs7gp1S8S5@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ3SjigRQ01vzj2YNBGiLd3364DlAsuKg2kHhjnKo2+FzYRWrp
	+kZn26xL+ip0Aclzj/t33sxQednUfwuhc5OVAOA97g7Xu7HDz3a1SEWJppav8Gu+jgJ0vXrZ+Um
	/O/jz+amuUWBjg2mCBCCIbEanr5901geuZj8wddYeoapm/gOJmHiVNc2x7Oly/TSv6ccy
X-Gm-Gg: ATEYQzxKkCY67DjqX6xxN78CpCPoCOfS6Uf8/LR7aCBfobRh9LK1LtVHLZw7CxwUFbN
	XIgDTLwqHdCceTz7pLt1ej/LstELIDfsP+TRKxaRpPRXbTcQ0tYMPU3emgxhgMT6NCqg1E52I2L
	WshBKY1Ojw2qQ6fDCnx5+Xy2hM+kNaKEqUSvIV3zYvzvVsU54p/+GyGtuscG2Acov6vyOp7BII9
	SG/hYtdnMYk7xZDDTmHZx1+d93uq1iawDq/ZbGRkfxwToctLz1clbLPnLUwArqjYz/VGX+jtPC5
	ecWhf6f3swBsuLrVsXUpoo14Wi6ujKnjRjql+PtVZj9fEIgQsPsSxUNh/gfFW00tTKN/XeRyDrn
	emNTw7u1+6ne1Fzd7Il4h6a8L3h+9Ze5QM3pET8mEbxOwj6WkOELvcIrTu2x/NxgVz7ZruCrLPT
	0W/SljDHaC1Nvw76TRrJ8xGKOWvKFRcmjeCwk=
X-Received: by 2002:a05:622a:210:b0:509:aa4:4a02 with SMTP id d75a77b69052e-50957d21b89mr50678371cf.29.1773418003841;
        Fri, 13 Mar 2026 09:06:43 -0700 (PDT)
X-Received: by 2002:a05:622a:210:b0:509:aa4:4a02 with SMTP id d75a77b69052e-50957d21b89mr50677381cf.29.1773418003103;
        Fri, 13 Mar 2026 09:06:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1563775a2sm1588559e87.89.2026.03.13.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:06:41 -0700 (PDT)
Date: Fri, 13 Mar 2026 18:06:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v1] Bluetooth: btusb: Allow firmware re-download when
 version matches
Message-ID: <zcn4iagkp4wtcg24obdhlv6pj6xyakcbezuzz6so3nvwneuybo@5bg3qjsuajqd>
References: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: n_uEfSUWTGITfSyo6cgMhz0OJpQD1Sss
X-Proofpoint-GUID: n_uEfSUWTGITfSyo6cgMhz0OJpQD1Sss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfXzuEzHBEA8LxJ
 mGBinBO9KZk0y3oXC70J+IawLPLyaMosVxsd3FjVNN9k1UBzIykqYNDX8iY27feOaQz2oxYN0MW
 V2AKUtr4R4njsVxy9C36nsgwtlNnH/eMf5MDPKDWZ8Xz9RROl9wN7VrQRHNPz9+wlr3y4lRf/ge
 bGH4HBAP5d89l9IDVwCfTiKAXooROKbCZAOETVJ/lIFgXpF6vHzOYFI9WlZiT3jdHqco3KeUJ/D
 +MIzWLZtmNnVQg1xTCfPBpY4kSnQWKYm9/8Ib6ONQdJ5zHhead4vnjM1wa3dm8G48TNYkNdC7u6
 LccnR5rxIqMnoSF9woqqZbGM8Wa9cuf9skwdaQ+NNIba5xZZJJIlc0/2QBThvAJH6frfYomhhN1
 R+8dDgyRJ7BqonCUEyYb7v345KdQ5F3v2AnT8tpXOv2DAwXEoSAel0xcjT9A8h4adBgWbgZZjXs
 YF351wD4tZHzU4Dm27Q==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b43614 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=XLcW7MSiMK0kOx3OsRAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130128
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97576-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93181286B49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Jan 08, 2026 at 03:43:53PM +0800, Shuai Zhang wrote:
> Since USB can disconnect at any time, if it disconnects during
> the BT firmware download, the BT controller firmware version may still
> be updated even without completing the download.

Does it not have any check for not completing firmware update if the
download was not successful / complete?

> 
> When USB reconnects, the BT host detects the same version as in the
> firmware file, which prevents the firmware from being downloaded again.
> 
> Therefore, remove the equality check to ensure that after
> USB reconnection, the BT host can still download the firmware.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btusb.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 646de80c7..991064a25 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3503,7 +3503,10 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>  		    "firmware rome 0x%x build 0x%x",
>  		    rver_rom, rver_patch, ver_rom, ver_patch);
>  
> -	if (rver_rom != ver_rom || rver_patch <= ver_patch) {
> +	/* Allow rampatch if version is greater than or equal to firmware version.
> +	 * Equal versions are acceptable for re-flashing or recovery scenarios.
> +	 */
> +	if (rver_rom != ver_rom || rver_patch < ver_patch) {
>  		bt_dev_err(hdev, "rampatch file version did not match with firmware");
>  		err = -EINVAL;
>  		goto done;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

