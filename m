Return-Path: <linux-arm-msm+bounces-63891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A2AFACF6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 576B31897954
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 07:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0FE21CA08;
	Mon,  7 Jul 2025 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ey9EWRS8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963B28643A;
	Mon,  7 Jul 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872898; cv=none; b=Hn7fUoc0tNAWhPw7t1FeXhz3oU8bC4VVvod5YbXLMl7B7VtXGuQeqOjBqSCsX0BM7RzwQK6OXYCGFIMcLDby8vo1y+ZSqnFWpORIOYYqldbeJfkC4hLmhj6uHZbC3ZNPYt9Lp3vNhDodTxaGiTlu5Y4PZ9XvyAOOKb+WhFoYrXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872898; c=relaxed/simple;
	bh=DdpRHe4UYNpg+Kx/nRT5/DZxj4Bv+oF1vrVnCQquN+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OmujxWvGIASR3MLrmSLXlGQkYbM0QjiOJCJ1TEBun2qTb3bgy/U3pI8tn2WGQJCA0JGQW7xSa0bOIzh9yaBcRp6qTXhPcQyfqG9LzMaIkzfW5IVomHpslGMAay1LK6IzF2ILI4c1qzuCPzsjNyeEL65smaa7QsYqbuDFKdsLXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ey9EWRS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566NmFJ4023870;
	Mon, 7 Jul 2025 07:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iOhqsZwsGmsazwO7QplGxnPzCOK9w+FCFWmYI6okG8=; b=Ey9EWRS8yH1DztKZ
	wSM6kskacL07mLEAiidArgWmlLy57HHYkEhYQAx65UPHFvdW4MEIoZ+w+wWJT6wJ
	XJ/0JyvFDoijgEA25gzcSBYqZYqQT3CVbaWbV1shfny8SePA2utC5XOE+uTUggJC
	vkvjHzy0puFRkiDdwmwBtzUXq4Gp9vvPd2eMKYITHNG8LTR1/tQcTZGLyvnhgMrB
	B4JtacuGzWCUXGLuieKiDXYDXoT/4EdFcy0Uw6YL2cp/piBgjq7bd9hbwkqVfKW4
	dGUpsF5OIMu7/zimGvCpLXn0ugYc78R3MIcEvJTIBFT8s8UsE8TkRK4/JWpPy8Uw
	sRHvcw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97ajku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:21:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5677LYT6017739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Jul 2025 07:21:34 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 7 Jul
 2025 00:21:33 -0700
Message-ID: <7a823b6d-767b-4777-8db0-761a2d0e09be@quicinc.com>
Date: Mon, 7 Jul 2025 15:21:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] net: bluetooth: add callback to exe l2cap when
 read_security uncompleted
To: <linux-bluetooth@vger.kernel.org>
CC: <quic_bt@quicinc.com>, <linux-arm-msm@vger.kernel.org>
References: <20250627030229.1720287-1-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <20250627030229.1720287-1-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686b757f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=h1sHxUaPK__U9Hd7B94A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0MSBTYWx0ZWRfX6eLePpZrb4nn
 uEuDEiu5oyY9outZkH44RYkavPFXTNAweTtNZ7oWe4v7p6eyarSigRUDpgsWV48U21g7iZBYeJy
 irCYT8Kk1+m9rKVK1TjEuOWNCpN9OhJOAN84EdOeokmJ6ccXK2WGqAsO+l4NzDACUHPu3tsB9Yq
 ZcDBu/hy2TyrVMkVJ2/np3Ver3pr8+AVwbmbtAczBe91ldg4fZZYaC51Hlk4R5Pf06QWHd/P7Xo
 fDPWcrPgeG/ZYPTGVnObxE98X30unY1UqwXuWEHEdSKwi1imiQ+24xegLDzP/VfGCFqmms+27hR
 cwpq1xZK7SFFl+qAtQqZDmLGE2fvUJ8s9Y6L8CisVcG6NAYn5ZcRuwv2RBFn1r/DT1sQY+96+3Q
 kXskGcj3zZnIvoSMHVETslnWegtA9YYqrrjKDeLrW258OGy9bglLIHgj6yoxB1PygGFdu1Fl
X-Proofpoint-GUID: PzOhEiLWY60nBjYDaGpcNGFh1m5pKnRl
X-Proofpoint-ORIG-GUID: PzOhEiLWY60nBjYDaGpcNGFh1m5pKnRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070041

Dear all

On 2025/6/27 11:02, Shuai Zhang wrote:
> When the DUT receives a remote L2CAP Connection Request during the Read
> Encryption Key Size procedure, if it fails to complete reading the
> Encryption Key Size while processing the request, it will respond with
> a Connection Response – Refused (security block), resulting in the
> disconnection of the remote device.
> 
> Use HCI_CONN_ENC_KEY_READY to determine whether
> l2cap_connect_request is pending.
> 
> When l2cap_connect occurs before the read_enc_key_size event, it will
> be pending because HCI_CONN_ENC_KEY_READY has not yet been set.
> The connection request will be processed once the read_enc_key_size
> event completes.
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---
>  include/net/bluetooth/hci_core.h |  3 +++
>  include/net/bluetooth/l2cap.h    | 10 +++++++++-
>  net/bluetooth/hci_event.c        | 16 ++++++++++++++++
>  net/bluetooth/l2cap_core.c       | 30 ++++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> index b47c74080..db329abbf 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -767,6 +767,8 @@ struct hci_conn {
>  
>  	struct bt_codec codec;
>  
> +	struct l2cap_pending_connect *pending_connect;
> +
>  	void (*connect_cfm_cb)	(struct hci_conn *conn, u8 status);
>  	void (*security_cfm_cb)	(struct hci_conn *conn, u8 status);
>  	void (*disconn_cfm_cb)	(struct hci_conn *conn, u8 reason);
> @@ -970,6 +972,7 @@ enum {
>  	HCI_CONN_CREATE_PA_SYNC,
>  	HCI_CONN_PA_SYNC,
>  	HCI_CONN_PA_SYNC_FAILED,
> +	HCI_CONN_ENC_KEY_READY,
>  };
>  
>  static inline bool hci_conn_ssp_enabled(struct hci_conn *conn)
> diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
> index 4bb0eaedd..b1ccd56bd 100644
> --- a/include/net/bluetooth/l2cap.h
> +++ b/include/net/bluetooth/l2cap.h
> @@ -679,6 +679,13 @@ struct l2cap_user {
>  	void (*remove) (struct l2cap_conn *conn, struct l2cap_user *user);
>  };
>  
> +struct l2cap_pending_connect {
> +	struct l2cap_conn *conn;
> +	struct l2cap_cmd_hdr cmd;
> +	u8 data[sizeof(struct l2cap_conn_req)];
> +	u8 rsp_code;
> +};
> +
>  #define L2CAP_INFO_CL_MTU_REQ_SENT	0x01
>  #define L2CAP_INFO_FEAT_MASK_REQ_SENT	0x04
>  #define L2CAP_INFO_FEAT_MASK_REQ_DONE	0x08
> @@ -976,5 +983,6 @@ void l2cap_conn_put(struct l2cap_conn *conn);
>  
>  int l2cap_register_user(struct l2cap_conn *conn, struct l2cap_user *user);
>  void l2cap_unregister_user(struct l2cap_conn *conn, struct l2cap_user *user);
> -
> +void l2cap_process_pending_connect(struct l2cap_conn *conn,
> +				   struct l2cap_cmd_hdr *cmd, u8 *data, u8 rsp_code);
>  #endif /* __L2CAP_H */
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index c4b87bfb4..6c992f83e 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -32,6 +32,7 @@
>  #include <net/bluetooth/bluetooth.h>
>  #include <net/bluetooth/hci_core.h>
>  #include <net/bluetooth/mgmt.h>
> +#include <net/bluetooth/l2cap.h>
>  
>  #include "hci_debugfs.h"
>  #include "hci_codec.h"
> @@ -766,10 +767,23 @@ static u8 hci_cc_read_enc_key_size(struct hci_dev *hdev, void *data,
>  		/* Update the key encryption size with the connection one */
>  		if (key_enc_size && *key_enc_size != conn->enc_key_size)
>  			*key_enc_size = conn->enc_key_size;
> +		set_bit(HCI_CONN_ENC_KEY_READY, &conn->flags);
>  	}
>  
>  	hci_encrypt_cfm(conn, status);
>  
> +	/*Defer l2cap_connect here if it's triggered before key size is read.*/
> +	if (conn->pending_connect) {
> +		struct l2cap_pending_connect *pc = conn->pending_connect;
> +
> +		conn->pending_connect = NULL;
> +
> +		bt_dev_dbg(hdev, "Defer l2cap_connect");
> +		l2cap_process_pending_connect(pc->conn, &pc->cmd, pc->data, pc->rsp_code);
> +
> +		kfree(pc);
> +	}
> +
>  done:
>  	hci_dev_unlock(hdev);
>  
> @@ -3396,6 +3410,8 @@ static void hci_disconn_complete_evt(struct hci_dev *hdev, void *data,
>  	if (!conn)
>  		goto unlock;
>  
> +	clear_bit(HCI_CONN_ENC_KEY_READY, &conn->flags);
> +
>  	if (ev->status) {
>  		mgmt_disconnect_failed(hdev, &conn->dst, conn->type,
>  				       conn->dst_type, ev->status);
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 40daa3827..c4cb60e65 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -3982,6 +3982,30 @@ static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
>  	struct l2cap_chan *chan = NULL, *pchan = NULL;
>  	int result, status = L2CAP_CS_NO_INFO;
>  
> +	/* If encryption is requested, but the key size is not ready yet,
> +	 * we need to wait for the key size to be ready before we can
> +	 * proceed with the connection. We do this by deferring the
> +	 * connection request until the key size is ready. This is done
> +	 * by storing the connection request in the hcon->pending_connect
> +	 * field. The connection request will be retried when the key size
> +	 * is ready.
> +	 */
> +	if (test_bit(HCI_CONN_ENCRYPT, &conn->hcon->flags) &&
> +	    !test_bit(HCI_CONN_ENC_KEY_READY, &conn->hcon->flags)) {
> +		struct l2cap_pending_connect *pc;
> +
> +		pc = kzalloc(sizeof(*pc), GFP_KERNEL);
> +		if (!pc)
> +			return;
> +		pc->conn = conn;
> +		memcpy(&pc->cmd, cmd, sizeof(*cmd));
> +		memcpy(pc->data, data, sizeof(struct l2cap_conn_req));
> +		pc->rsp_code = rsp_code;
> +		BT_DBG("store request and retried when keysize is ready");
> +		conn->hcon->pending_connect = pc;
> +		return;
> +	}
> +
>  	u16 dcid = 0, scid = __le16_to_cpu(req->scid);
>  	__le16 psm = req->psm;
>  
> @@ -4105,6 +4129,12 @@ static void l2cap_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
>  	l2cap_chan_put(pchan);
>  }
>  
> +void l2cap_process_pending_connect(struct l2cap_conn *conn, struct l2cap_cmd_hdr *cmd,
> +				   u8 *data, u8 rsp_code)
> +{
> +	l2cap_connect(conn, cmd, data, rsp_code);
> +}
> +
>  static int l2cap_connect_req(struct l2cap_conn *conn,
>  			     struct l2cap_cmd_hdr *cmd, u16 cmd_len, u8 *data)
>  {

Is there any update?

thanks,
Shuai

